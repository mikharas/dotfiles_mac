import styles from "./styles.jsx"

const style = {
  color: styles.colors.red
};

export default ({ msg }) => {
  if (typeof msg === "undefined") return null;
  return <div style={style}>{msg}</div>;
};
