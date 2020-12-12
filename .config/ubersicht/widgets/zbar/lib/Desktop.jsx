import Icon from './Icon.jsx';

const containerStyle = {
  display: "grid",
  gridAutoFlow: "column",
  gridGap: "8px",
  padding: '2px 0',
};

// const spaceColors = ['#b48eaa', '#cb6153', '#ffa674', '#fec26a', '#99bfab', '#b48c8d'];
const spaceColors = ['#BB80B3', '#FF5370', '#F78C6C', '#FFCB6B', '#C3E88D', '#82AAFF'];

const renderSpace = ({ index, windows, focused }) => {
  const contentStyle = {
    color: '#2f2f2f',
    backgroundColor: focused
      ? spaceColors[index % spaceColors.length]
      : 'grey',
    fontSize: '12px',
    fontWeight: 'bold',
    margin: '0',
    padding: '0 0.5em',
    display: 'flex',
    alignItems: 'center',
    height: '20px',
    borderRadius: '4px',
  };

  return (
    <div style={contentStyle}>
      {'[' + index + ']'}
      { windows.map(({ appName }) => <Icon appName={appName} />) }
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
