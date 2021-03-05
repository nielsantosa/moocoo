// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { onClick } from './vidtest';
import { playAhead } from './buttontest';
import { vidOrderAlert } from './vidorderalert';


// import { initSelect2 } from '../components/init_select2';
import { initTabImageOnClick } from '../components/_tab_images';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  initTabImageOnClick();

  vidOrderAlert ();

  // const element = document.querySelector("#article");
  // element.addEventListener("ajax:success", (event) => {
  //   let quantity = document.getElementById('quantity').value
  //   if (quantity >= 1) {
  //     element.insertAdjacentHTML("beforeend", `<div class="alert alert-warning alert-dismissible fade show m-1" role="alert">
  //       Successfully added to cart
  //   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
  //         <span aria-hidden="true">&times;</span>
  //       </button>
  //     </div>`);
  //   } else {
  //     element.insertAdjacentHTML("beforeend", `<div class="alert alert-warning alert-dismissible fade show m-1" role="alert">
  //       Please insert quantity
  //   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
  //         <span aria-hidden="true">&times;</span>
  //       </button>
  //     </div>`);
  //   }
  // });
});

<<<<<<< HEAD
=======
document.addEventListener('turbolinks:request-start', () => {
  const spinner = document.querySelector('#spinner');
  spinner.style.display = 'flex';
});

document.addEventListener('turbolinks:request-end', () => {
  const spinner = document.querySelector('#spinner');
  spinner.style.display = 'none';
});
>>>>>>> origin/master
