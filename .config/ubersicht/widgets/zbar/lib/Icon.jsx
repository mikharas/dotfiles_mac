import styles from './styles.jsx';

const getIcon = appName => {
  switch (appName) {
    case 'Activity Monitor':
      return 'fas fa-heartbeat';

    case 'Android Studio':
      return 'fab fa-android';

    case 'App Store':
      return 'fab fa-app-store-ios';

    case 'Calculator':
      return 'fas fa-calculator';

    case 'Calendar':
      return 'far fa-calendar-alt';

    case 'Discord':
      return 'fab fa-discord';

    case 'FaceTime':
      return 'fas fa-phone-square';

    case 'Final Cut Pro':
      return 'fas fa-photo-video';

    case 'Finder':
      return 'fa fa-folder';

    case 'Google Chrome':
      return 'fab fa-chrome';

    case 'iTerm2':
      return 'fa fa-terminal';

    case 'Journey':
      return 'fas fa-book';

    case 'KakaoTalk':
      return 'fa fa-comments';

    case 'Logic Pro X':
      return 'fas fa-record-vinyl';

    case 'Photoshop CC':
      return 'fas fa-camera-retro';

    case 'Mail':
      return 'fa fa-envelope';

    case 'Messenger':
      return 'fab fa-facebook-messenger';

    case 'Microsoft Excel':
      return 'fas fa-table';

    case 'Music':
      return 'fa fa-music';

    case 'Notes':
      return 'fas fa-sticky-note';

    case 'Pock':
      return '';

    case 'Preview':
      return 'fas fa-file-alt';

    case 'qBittorrent':
      return 'fas fa-download';

    case 'QuickTime Player':
      return 'fas fa-play-circle';

    case 'Reminders':
      return 'fas fa-list-ul';

    case 'Spotify':
      return 'fab fa-spotify';

    case 'Spotlight':
      return 'fas fa-search';

    case 'stoic.':
      return 'fas fa-book-medical';

    case 'System Preferences':
      return 'fa fa-cogs';

    case 'Unity':
      return 'fa fa-gamepad';

    case 'Code':
      return 'fas fa-code';

    case 'Xcode':
      return 'fab fa-xing';

    case 'zoom.us':
      return 'fa fa-video-camera';

    default:
      return 'fa fa-question-circle';
  }
}

const style = {
  margin: '0 0.3em',
  color: '#2e3440',
};

export default ({ focused, appName }) => {
  const iconClass = getIcon(appName);
  const fontScale = (iconClass.slice(0,2) == 'fa') ? '1.3em' : '1.7em'
  return iconClass && <i
    className={iconClass}
    style={{
      ...style,
        color: focused ? styles.colors.workspace_active_fg : styles.colors.workspace_inactive_fg,
      fontSize: fontScale,
    }}/>
}
