import Desktop from "./lib/Desktop.jsx";
import Error from "./lib/Error.jsx";
import parse from "./lib/parse.jsx";
import styles from "./lib/styles.jsx";

const style = {
  padding: "0 8px",
  display: "grid",
  gridAutoFlow: "column",
  gridGap: "16px",
  position: "fixed",
  overflow: "hidden",
  left: "0px",
  top: "0px",
  fontFamily: styles.fontFamily,
  lineHeight: styles.lineHeight,
  fontSize: styles.fontSize,
  color: styles.colors.dim,
  fontWeight: styles.fontWeight
};

export const refreshFrequency = false;
export const command = "./zbar/scripts/spaces.sh";

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

export const render = ({ output }) => {
  const data = parse(output);
  if (typeof data === "undefined") {
    return (
      <div style={style} />
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
