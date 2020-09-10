import subprocess
import re
import json

space_to_windows = {}

result = subprocess.run(['/usr/local/bin/yabai', '-m', 'query', '--windows'], stdout=subprocess.PIPE).stdout.decode('utf-8').replace('\t', '')

delimiters = []
delimiters.extend([m.start() for m in re.finditer('},{', result)])
delimiters.append(len(result))

start = 0
for i in delimiters:
    s = result[start: i]
    space = re.search(r'(?<=\"space\":).*(?=\,)', s).group(0)
    name = re.search(r'(?<=\"app\":).*(?=\,)', s).group(0)[1:-1]
    visible = re.search(r'(?<=\"focused\":).*(?=\,)', s).group(0)
    aid = re.search(r'(?<=\"id\":).*(?=\,)', s).group(0)

    if space not in space_to_windows:
        space_to_windows[space] = []

    space_to_windows[space].append({
        "name": name,
        "visible": visible,
        "aid": aid
    })

    start = i + 1

for spaceIndex in space_to_windows.keys():
    space_to_windows[spaceIndex].sort(key=lambda x: x["aid"])

r = json.dumps(space_to_windows)
print(r)
