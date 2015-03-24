$(document).ready(function() {
  redirectTrigger = $("#download-gpx");

  redirectTrigger.on("click", function() {
    waitTwoAndRedirectTo("/locations");
  });
});

var waitTwoAndRedirectTo = function(url){
  setTimeout(function() { window.location.replace(url) }, 2000);
};
