import axios from "axios";

const EVENTS: Array<any> = [];

document.onreadystatechange = () => {
  if (document.readyState !== "complete") {
    return;
  }

  window.addEventListener("message", (event) => {
    const name = event.data.name;
    const data = event.data.data;

    EVENTS.forEach(e => {
      if (e.name == name) {
        e.callback(data);
      }
    })
  })

  // @ts-ignore: Undefined Function Error
  axios.post(`http://${GetParentResourceName()}/ready`);
}