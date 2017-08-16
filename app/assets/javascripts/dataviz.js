if ($('#before-results .card-graph').length % 3 != 0) {
  console.log("il faut en rajouter");
  $('#before-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
}

if ($('#find-results .card-graph').length % 3 != 0) {
  console.log("il faut en rajouter");
  $('#find-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
}


if ($('#research-results .card-graph').length % 4 != 0) {
  console.log("il faut en rajouter");
  $('#research-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
}

$('#search-name').click(function(){
  SearchName = $('input#search_name').val();
  var url = window.location.href.split('?')[0] + "?search=" + SearchName;
  window.location = url;
});


$("document").ready(function($){
    var nav = $('.navbar-wagon');

    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
          $('.logo-dataviz').css("margin-left", "-69px");
          $('.name-logo').css("opacity","1");
          $('.name-logo').css("left","-31px");
        } else {
          $('.logo-dataviz').css("margin-left", "0px");
          $('.name-logo').css("opacity","0");
          $('.name-logo').css("left","0");
        }
    });
});

$("#search_name").on('keyup', function (e) {
    if (e.keyCode == 13) {
        SearchName = $('input#search_name').val();
        var url = window.location.href.split('?')[0] + "?search=" + SearchName;
        window.location = url;
    }
});
