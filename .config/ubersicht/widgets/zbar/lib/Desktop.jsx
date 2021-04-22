import Icon from './Icon.jsx';
import styles from './styles.jsx';

const containerStyle = {
  display: "grid",
  gridAutoFlow: "column",
  gridGap: "4px",
  padding: '3px 30px',
  paddingLeft: '700px',
};

const spaceColors = styles.colors.workspace_active_bg;

const renderSpace = ({ index, windows, focused }) => {
  const contentStyle = {
    color: focused ? styles.colors.workspace_active_fg : styles.colors.workspace_inactive_fg,
    backgroundColor: focused
      ? spaceColors[index % spaceColors.length]
      : styles.colors.workspace_inactive,
    fontSize: '12px',
    fontWeight: 'bold',
    margin: '0 0.4em',
    padding: '0 0.6em',
    display: 'flex',
    alignItems: 'center',
    height: '25px',
    borderRadius: '5px',
  };

  return (
    <div style={contentStyle}>
      <div>{windows.appName}</div>
      {'[' + index + ']'}
      { windows.map(app => app && <Icon focused={focused} appName={app.appName} />) }
    </div>
  );
};

export default ({ output }) => {
  if (typeof output === "undefined") return null;

  return (
    <div style={containerStyle}>
      {output.map(renderSpace)}
    </div>
  );
};
