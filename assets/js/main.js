/* ERC Search site behaviour: menu, home slider, back to top, enquiry form. */
(function () {
  "use strict";
  var timer = null;
  var reduce = function () { return window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches; };

  function init() {
    var toggle = document.querySelector(".nav-toggle");
    var nav = document.getElementById("site-nav");
    if (toggle && nav) {
      toggle.onclick = function () {
        var open = toggle.getAttribute("aria-expanded") !== "true";
        toggle.setAttribute("aria-expanded", String(open));
        nav.classList.toggle("is-open", open);
      };
    }

    clearInterval(timer);
    var slides = Array.prototype.slice.call(document.querySelectorAll(".slide"));
    var dots = Array.prototype.slice.call(document.querySelectorAll(".slider-dots button"));
    if (slides.length > 1) {
      var i = 0;
      var show = function (n) {
        i = (n + slides.length) % slides.length;
        slides.forEach(function (s, k) { s.classList.toggle("is-active", k === i); s.setAttribute("aria-hidden", k === i ? "false" : "true"); });
        dots.forEach(function (d, k) { d.setAttribute("aria-current", k === i ? "true" : "false"); });
      };
      var restart = function () {
        clearInterval(timer);
        if (!reduce()) timer = setInterval(function () { show(i + 1); }, 6000);
      };
      dots.forEach(function (d, k) { d.onclick = function () { show(k); restart(); }; });
      var prev = document.querySelector(".slider-prev");
      var next = document.querySelector(".slider-next");
      if (prev) prev.onclick = function () { show(i - 1); restart(); };
      if (next) next.onclick = function () { show(i + 1); restart(); };
      var slider = document.querySelector(".slider");
      slider.onmouseenter = function () { clearInterval(timer); };
      slider.onmouseleave = restart;
      restart();
    }

    var form = document.querySelector("form.enquiry-form");
    if (form) {
      form.onsubmit = function (e) {
        if (form.getAttribute("action")) return;
        e.preventDefault();
        var d = new FormData(form);
        var name = String(d.get("name") || "");
        var body = "Name: " + name + "\nEmail: " + (d.get("email") || "") + "\nPhone: " + (d.get("tel") || "") + "\n\n" + (d.get("message") || "");
        window.location.href = "mailto:" + form.getAttribute("data-mailto") + "?subject=" + encodeURIComponent("Enquiry from " + name) + "&body=" + encodeURIComponent(body);
      };
    }
  }

  document.addEventListener("click", function (e) {
    if (e.target.closest && e.target.closest(".footer-top")) { e.preventDefault(); window.scrollTo({ top: 0, behavior: reduce() ? "auto" : "smooth" }); }
  });
  window.ercInit = init;
  if (document.readyState !== "loading") init(); else document.addEventListener("DOMContentLoaded", init);
})();
