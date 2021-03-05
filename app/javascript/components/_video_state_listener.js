import { fetchWithToken } from "../utils/fetch_with_token";

const initAddEventListenerToVideo = () => {
  var myTime=setInterval(function () {myTimer()}, 1000);

  // 2a. Set the player size
  let widthMultiplier = 0.8;
  if (window.innerWidth <= 480) {
    widthMultiplier = 0.92;
  }
  const playerWidth = widthMultiplier * window.innerWidth;
  const playerHeight = 9/16*playerWidth;

  // Set the width of the big-player-container
  document.querySelector(".big-player-container").style.height = `${playerHeight}px`;
  console.log(playerHeight);
  document.querySelector(".big-player-container").style.width = playerWidth;

  const annotations = document.querySelectorAll(".annotations .annotation");
  let annotationsArray = [];

  annotations.forEach((annotation, index) => {
    let annotationHash = {
      id: index,
      annotationElement : annotation,
      timeStart: annotation.dataset.timeStart,
      timeEnd: annotation.dataset.timeEnd,
      xCoordinate: annotation.dataset.xCoordinate,
      yCoordinate: annotation.dataset.yCoordinate
    };
    annotationsArray.push(annotationHash);
    annotation.style.top = `${Math.floor(annotationHash.xCoordinate*100)}%`;
    annotation.style.left = `${Math.floor(annotationHash.yCoordinate*100)}%`;
  });

  function myTimer() {
    console.log("Time is ticking");
    let videoCurrentTime = player.getCurrentTime();

    annotationsArray.forEach((aHash)=> {
      if (videoCurrentTime >= aHash.timeStart && videoCurrentTime <= aHash.timeEnd) {
        aHash.annotationElement.querySelector(".annotation-button").style.display = "inline";
      } else {
        aHash.annotationElement.querySelector(".annotation-button").style.display = "none";
      }
    })
  }

  const clickAnnotationCircle = (e) => {
    e.preventDefault();
    e.currentTarget.parentElement.querySelector("div").classList.toggle("annotation-product-block");
  }

  annotations.forEach((annotation) => {
    annotation.querySelector(".annotation-button").addEventListener('click', clickAnnotationCircle);
  })

  const clickAddToCart = (e) => {
    e.preventDefault();
    const productId = parseInt(e.currentTarget.dataset.productId, 10);
    // console.log(e.currentTarget.parentElement.parentElement);
    // fetch url!!
    // const crsfToken = document.querySelector("[name='csrf-token']").content;

    fetchWithToken("/orders", {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
        },
      body: JSON.stringify({
        product: {
          product_id: productId,
          quantity: 1
          }
        })
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
    });
  };

  const annotationCarts = document.querySelectorAll(".annotations .annotation-add-to-cart")
  annotationCarts.forEach((annotationCart) => {
    annotationCart.addEventListener('click', clickAddToCart);
  })
}

export { initAddEventListenerToVideo };
