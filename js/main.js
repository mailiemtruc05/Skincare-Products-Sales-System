(function ($) {
  "use strict";

  // Spinner
  var spinner = function () {
    setTimeout(function () {
      if ($("#spinner").length > 0) {
        $("#spinner").removeClass("show");
      }
    }, 1);
  };
  spinner();

  // Initiate the wowjs
  new WOW().init();

  // Fixed Navbar
  $(window).scroll(function () {
    if ($(window).width() < 992) {
      if ($(this).scrollTop() > 45) {
        $(".fixed-top").addClass("bg-white shadow");
      } else {
        $(".fixed-top").removeClass("bg-white shadow");
      }
    } else {
      if ($(this).scrollTop() > 45) {
        $(".fixed-top").addClass("bg-white shadow").css("top", -45);
      } else {
        $(".fixed-top").removeClass("bg-white shadow").css("top", 0);
      }
    }
  });

  // Back to top button
  document.querySelector(".back-to-top").addEventListener("click", function (e) {
    e.preventDefault();
    window.scrollTo({
      top: 0,
      behavior: "smooth", // Thêm hiệu ứng cuộn mượt mà
    });
  });

  // Testimonials carousel
  $(".testimonial-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1000,
    margin: 25,
    loop: true,
    center: true,
    dots: false,
    nav: true,
    navText: ['<i class="bi bi-chevron-left"></i>', '<i class="bi bi-chevron-right"></i>'],
    responsive: {
      0: {
        items: 1,
      },
      768: {
        items: 2,
      },
      992: {
        items: 3,
      },
    },
  });
})(jQuery);
///

$(document).ready(function () {
  $(".method").on("click", function () {
    $(".method").removeClass("blue-border");
    $(this).addClass("blue-border");
  });
});
var $cardInput = $(".input-fields input");

$(".next-btn").on("click", function (e) {
  $cardInput.removeClass("warning");

  $cardInput.each(function () {
    var $this = $(this);
    if (!$this.val()) {
      $this.addClass("warning");
    }
  });
});
