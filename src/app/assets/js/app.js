import "../css/app.css";
import "./htmx.min.js";

const cards = document.querySelectorAll(".flip-card-inner");
const flipCardDesc = document.getElementsByClassName("flip-card-desc");

[...cards].forEach((card) => {
  addFlipListener(card);
});

function addFlipListener(card) {
  card.addEventListener("click", function () {
    card.style.transform += " rotateY(180deg) ";
    card.classList.toggle("is-flipped");

    if (card.classList.contains("is-flipped")) {
      console.log("card flipped");
      flipCardDesc.hidden = false;
      console.log(flipCardDesc.hidden);
    } else {
      console.log("card flipped");
      flipCardDesc.hidden = true;
      console.log(flipCardDesc.hidden);
    }
  });
}
