import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper('.swiper', {
      // Optional parameters
      direction: 'vertical',
      loop: true,

      // If we need pagination
      pagination: {
        el: '.swiper-pagination',
      },

      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

      // And if we need scrollbar
      scrollbar: {
        el: '.swiper-scrollbar',
      },

      autoplay: {
        delay: 4000,
      }

    });
  }
}


/* ------ POSSIBLE FEATURES FOR THE SLIDER -START
autoplay: {
  delay: 4000,
}

  fadeEffect: {
    crossFade: true},

effect: 'fade',  //-- can be placed below the loop parameter
------ POSSIBLE FEATURES FOR SLIDERS -END */
