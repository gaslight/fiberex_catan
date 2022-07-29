import "phoenix_html";
import React from "react";
import { createRoot } from "react-dom/client";
import App from "./App";

// import { LiveSocket } from "phoenix_live_view";

// const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");


// let liveSocket = new LiveSocket("/live", Socket, {
//   params: {_csrf_token: csrfToken}
// });

// // Connect if there are any LiveViews on the page
// liveSocket.connect();

// // Expose liveSocket on window for web console debug logs and latency simulation:
// // >> liveSocket.enableDebug()
// // >> liveSocket.enableLatencySim(1000)
// // The latency simulator is enabled for the duration of the browser session.
// // Call disableLatencySim() to disable:
// // >> liveSocket.disableLatencfiberex_catan_webySim()
// window.liveSocket = liveSocket;

const container = document.getElementById("root");
const root = createRoot(container);
root.render(<App />);
