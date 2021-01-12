import Desktop from "./lib/Desktop.jsx";
import Error from "./lib/Error.jsx";
import parse from "./lib/parse.jsx";
import styles from "./lib/styles.jsx";

const style = {
   borderRadius: '10px',
    // width: '90%',
    marginLeft: '25px',
    marginRight: '25px',
    padding: '3px 6px',
    border: '1px solid #393833',
    backgroundColor: '#393833',
    color: '#ECEFF1',
    fontFamily: 'Roboto',
    fontSize: '12px',

    height: '25px',

    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',

    position: 'fixed',
    left: '50%',
    transform: 'translateX(-70%)',
    top: '0.25%',
  fontFamily: styles.fontFamily,
  lineHeight: styles.lineHeight,
  fontSize: styles.fontSize,
  color: styles.colors.dim,
  fontWeight: styles.fontWeight
};

export const refreshFrequency = false;
export const command = "./zbar/fetch.sh";

const populateWindowNames = ({ spaces, windows }) => {
  const id2window = windows.reduce((acc, { id, app }) => {
    acc[id] = { id, appName: app };
    return acc;
  }, {});

  return spaces.map(space => ({
    ...space,
    windows: space.windows.map(id => id2window[id]),
  }))
};

export const render = ({ output }, ...args) => {
  const data = parse(output);
  if (typeof data === "undefined") {
    return (
      <div style={style}>
        <Error msg="Error: unknown script output" side="left" />
      </div>
    );
  }
  if (typeof data.error !== "undefined") {
    return (
      <div style={style}>
        <Error msg={`Error: ${data.error}`} side="left" />
      </div>
    );
  }
  const displayId = Number(window.location.pathname.replace(/\//g, ''));
  const display = data.displays.find(d => d.id === displayId);
  const populatedData = populateWindowNames(data);
  return (
    <div style={style}>
      <Desktop output={populatedData.filter(s => s.display === display.index)} />
    </div>
  );
};

export default null;
