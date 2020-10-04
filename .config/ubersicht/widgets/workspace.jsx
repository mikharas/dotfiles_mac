// import { defaultTheme } from "./lib/style";

export const command = "sh ./lib/workspace.sh";
export const refreshFrequency = 250;
// const command = "lib/workspace.sh";
// const refreshFrequency = 250; // ms

const colors = ['#b48eaa', '#cb6153', '#ffa674', '#fec26a', '#99bfab', '#b48c8d']


const renderSpace = (appList, spaceColor, spaceId) => {
    return (
        <div style = {{ backgroundColor: spaceColor, margin: '0 2px', padding: '0 0.4em', display: 'flex', alignItems: 'center', height: '25px', borderRadius: '5px' }}>
            <h3 style = {{ fontSize: '15px', color: '#2f2f2f', margin: '0.1em 0.3em 0 0' }}>
                {`[${spaceId}]`}
            </h3>
            {appList.map((i) => i)}
        </div>
    )
}

const renderAppIcon = (appName, visible) => {

    let className = null;
    let iconColor = (visible == 1 ? '#e5e9f0' : '#2e3440');

    if (appName == 'Google Chrome') {
        className="fa fa-chrome";
    } else if (appName == 'zoom.us') {
        className="fa fa-video-camera"
    } else if (appName == 'KakaoTalk') {
        className="fa fa-comments"
    } else if (appName == 'Unity') {
        className="fa fa-gamepad";
    } else if (appName == 'Discord') {
        className="fa fa-discord";
    } else if (appName == 'Music') {
        className="fa fa-music";
    } else if (appName == 'Finder') {
        className="fa fa-folder";
    } else if (appName == 'qBittorrent') {
        className="fa fa-download";
    } else if (appName == 'Calendar') {
        className="la la-calendar";
    } else if (appName == 'iTerm2') {
        className="fa fa-terminal";
    } else if (appName == 'Mail') {
        className="fa fa-envelope";
    } else if (appName == 'Xcode') {
        className="fab fa-xing";
    } else if (appName == 'Spotify') {
        className="la la-spotify";
    } else if (appName == 'Preview') {
        className="la la-file-text";
    } else if (appName == 'Microsoft Excel') {
        className="la la-th-list"
    } else if (appName == 'qbittorrent') {
        className="la la-cloud-download"
    } else if (appName == 'mpv') {
        className="la la-play-circle"
    } else if (appName == 'None') {
        className="la la-circle"
    } else if (appName == 'Lightroom Classic' | appName == 'Photoshop CC') {
        className="la la-camera-retro"
    } else if (appName == 'Adobe Premiere Pro CC 2019' | appName == 'Final Cut Pro' | appName == 'Adobe Media Encoder CC 2019') {
        className="la la-video-camera"
    } else if (appName == 'System Preferences') {
        className="fa fa-cogs"
    } else {
        className="fa fa-question-circle";
    }
    const fontScale = (className.slice(0,2) == 'fa') ? '1.3em' : '1.7em'
    return (
        <i className={className} style={{ margin: '0 0.15em 0 0.15em', color: iconColor, fontSize: fontScale}}/>
    );
}

const getContainers = (output) => {
    let containers = [];
    Object.keys(output).map((spaceId) => {
        let appList = [];
        // let spaceColor = 'red';
        let spaceColor = colors[spaceId % colors.length];
        output[spaceId].map(({ name, visible }) => {
            let appIcon = renderAppIcon(name, visible);
            appList.push(appIcon);
        })
        containers.push(renderSpace(appList, spaceColor, spaceId));
    })

    return containers;
}


const containerize = (output) => {
    // const { visible } = output;
    // delete output.visible;
    const containers = getContainers(output);
    console.log(containers);
    return (
        <div style={{ display: 'flex', flexDirection: 'row' }}>
            {containers}
        </div>
    )
}

const style = {
    borderRadius: '10px',
    // width: '90%',
    marginLeft: '25px',
    marginRight: '25px',
    padding: '3px 6px',
    border: '2px solid #ffa674',
    backgroundColor: '#393833',
    color: '#fff',
    fontFamily: 'Roboto',
    fontSize: '12px',

    height: '30px',

    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',

    position: 'fixed',
    left: '50%',
    transform: 'translateX(-70%)',
    top: '1%',

}

export const render = ({ output }) => {
    if (!output) return;
    const dat = JSON.parse(output);
    const renderFinal = containerize(dat);
    return (
        <div style={style}>
            {renderFinal}
        </div>
    )
}

// const render = ({ output }) => {
    // const r = JSON.parse(output);
    // console.log(r);
    // return <div>{`${r}`}</div>
// };

// export { command, refreshFrequency, renderClass as className, render };
