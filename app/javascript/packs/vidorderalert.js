
const removeAlert = () => {
  if (document.getElementById("alertcart")) {
    let myobj = document.getElementById("alertcart");
    myobj.remove();
  }
};

const addAlert = (element) => {
  removeAlert();
  let quantity = element.querySelector('#quantity').value;
  if (quantity >= 1) {
    element.insertAdjacentHTML("beforeend", `<div id="alertcart" class="alert alert-warning alert-dismissible fade show m-1" role="alert">
          Successfully added to cart
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>`);
  } else {
    element.insertAdjacentHTML("beforeend", `<div id="alertcart" class="alert alert-warning alert-dismissible fade show m-1" role="alert">
          Please insert quantity
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>`);
  }
}

const vidOrderAlert = () => {
  const elements = document.getElementsByClassName("item");
  Array.from(elements).forEach((element) => {
    element.addEventListener("ajax:success", (event) => {
      addAlert(element);
    });
  });
};

export { vidOrderAlert };