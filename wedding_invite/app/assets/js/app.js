import "../css/app.css";
import "./htmx.min.js";

const cards = document.querySelectorAll(".flip-card-inner");

[...cards].forEach((card) => {
  card.addEventListener("click", function () {
    card.classList.toggle("is-flipped");
  });
});
