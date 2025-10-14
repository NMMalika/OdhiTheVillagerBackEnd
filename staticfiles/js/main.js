"use strict";

(function ($) {
  /*------------------
        Preloader
    --------------------*/
  $(window).on("load", function () {
    $(".loader").fadeOut();
    $("#preloder").delay(200).fadeOut("slow");
  });

  /*------------------
        Background Set
    --------------------*/
  $(".set-bg").each(function () {
    var bg = $(this).data("setbg");
    $(this).css("background-image", "url(" + bg + ")");
  });

  /*------------------
		Navigation
	--------------------*/
  $(".mobile-menu").slicknav({
    prependTo: "#mobile-menu-wrap",
    allowParentLinks: true,
  });

  /*--------------------------
        Event Slider
    ----------------------------*/
  $(".event__slider").owlCarousel({
    loop: true,
    margin: 0,
    items: 3,
    dots: false,
    nav: true,
    navText: [
      "<i class='fa fa-angle-left'></i>",
      "<i class='fa fa-angle-right'></i>",
    ],
    smartSpeed: 1200,
    autoHeight: false,
    autoplay: true,
    responsive: {
      992: { items: 3 },
      768: { items: 2 },
      0: { items: 1 },
    },
  });

  /*--------------------------
        Videos Slider
    ----------------------------*/
  $(".videos__slider").owlCarousel({
    loop: true,
    margin: 0,
    items: 4,
    dots: false,
    nav: true,
    navText: [
      "<i class='fa fa-angle-left'></i>",
      "<i class='fa fa-angle-right'></i>",
    ],
    smartSpeed: 1200,
    autoHeight: false,
    autoplay: true,
    responsive: {
      992: { items: 4 },
      768: { items: 3 },
      576: { items: 2 },
      0: { items: 1 },
    },
  });

  /*------------------
		Magnific
	--------------------*/
  $(".video-popup").magnificPopup({
    type: "iframe",
  });

  /*------------------
        CountDown (Dynamic)
    --------------------*/
  if ($("#countdown-time").length > 0) {
    var deadline = $("#countdown-time").data("deadline");

    if (deadline) {
      // Convert Django date (e.g. 2025-10-15T20:30:00) to JS Date
      var targetDate = new Date(deadline);

      // Initialize countdown if plugin is loaded
      $("#countdown-time").countdown(targetDate, function (event) {
        $(this).html(
          event.strftime(
            "<div class='countdown__item'><span>%D</span> <p>Days</p></div>" +
              "<div class='countdown__item'><span>%H</span> <p>Hours</p></div>" +
              "<div class='countdown__item'><span>%M</span> <p>Minutes</p></div>" +
              "<div class='countdown__item'><span>%S</span> <p>Seconds</p></div>"
          )
        );
      });
    }
  }

  /*------------------
		Barfiller
	--------------------*/
  $("#bar1").barfiller({ barColor: "#ffffff" });
  $("#bar2").barfiller({ barColor: "#ffffff" });
  $("#bar3").barfiller({ barColor: "#ffffff" });

  /*-------------------
		Nice Scroll
	--------------------- */
  $(".nice-scroll").niceScroll({
    cursorcolor: "#111111",
    cursorwidth: "5px",
    background: "#e1e1e1",
    cursorborder: "",
    autohidemode: false,
    horizrailenabled: false,
  });
})(jQuery);

/*------------------
    Header Scroll Effect
--------------------*/
window.addEventListener("scroll", function () {
  document
    .querySelector(".header")
    .classList.toggle("scrolled", window.scrollY > 50);
});

/*------------------
    YouTube Video Preview
--------------------*/
document.addEventListener("DOMContentLoaded", function () {
  const playButton = document.getElementById("playVideo");
  const videoPreview = document.getElementById("videoPreview");

  if (playButton && videoPreview) {
    playButton.addEventListener("click", function (e) {
      e.preventDefault();

      const videoId = playButton.dataset.videoId;
      const videoTitle = playButton.dataset.videoTitle;

      if (videoId) {
        videoPreview.innerHTML = `
          <iframe width="100%" height="315"
            src="https://www.youtube.com/embed/${videoId}?autoplay=1"
            title="${videoTitle}"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
        `;
      } else {
        console.error("YouTube video ID not found.");
      }
    });
  }
});

/*------------------
    Event Carousel (Dynamic)
--------------------*/
$(document).ready(function () {
  var eventCount = $(".event__slider .event__item").length;

  // Set image backgrounds
  $(".set-bg").each(function () {
    var bg = $(this).data("setbg");
    $(this).css("background-image", "url(" + bg + ")");
  });

  // Initialize carousel
  $(".event__slider").owlCarousel({
    loop: eventCount > 3, // Only loop if more than 3 events
    margin: 30,
    items: Math.min(eventCount, 3), // Show as many as available (max 3)
    autoplay: eventCount > 1,
    autoplayTimeout: 5000,
    smartSpeed: 700,
    center: eventCount < 3, // Center items if less than 3
    responsive: {
      0: { items: 1 },
      768: { items: Math.min(eventCount, 2) },
      992: { items: Math.min(eventCount, 3) },
    },
  });
});
