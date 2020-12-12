const getIcon = appName => {
    let className = null;

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

    return className;
}

const style = {
  margin: '0 0.3em',
  color: '#2e3440',
};

export default ({ appName }) => {
    const iconClass = getIcon(appName);
    const fontScale = (iconClass.slice(0,2) == 'fa') ? '1.3em' : '1.7em'
    return (
        <i className={iconClass} style={{ ...style, fontSize: fontScale }}/>
    );
}
