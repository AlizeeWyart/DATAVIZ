if ($('#before-results .card-graph').length % 3 != 0) {
  console.log("il faut en rajouter");
  $('#before-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
}

if ($('#find-results .card-graph').length % 3 != 0) {
  console.log("il faut en rajouter");
  $('#find-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
}


if ($('#research-results .card-graph').length % 4 != 0 && $('#research-results .card-graph').length % 2 == 0) {
  console.log("il faut en rajouter");
  $('#research-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
}

if ($('#research-results .card-graph').length % 4 != 0 && $('#research-results .card-graph').length % 2 != 0) {
  console.log("il faut en rajouter");
  $('#research-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>");
  $('#research-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>");
}

$('#search-name').click(function(){
  SearchName = $('input#search_name').val();
  var url = window.location.href.split('?')[0] + "?search=" + SearchName;
  window.location = url;
});


$('#research-bar .research-bar-box a').hover(
  function(){
    thisA = $(this);
    thisRocket = thisA.find("i.fa.fa-rocket");
    thisRocket.removeClass("color-grey").addClass("color-wavestone");
    if (thisA.attr("id") == "rocket-2") {
      $('#research-bar .research-bar-box a#rocket-1 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
    } else if (thisA.attr("id") == "rocket-3") {
      $('#research-bar .research-bar-box a#rocket-1 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-2 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
    } else if (thisA.attr("id") == "rocket-4") {
      $('#research-bar .research-bar-box a#rocket-1 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-2 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-3 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
    }
  }, function() {
    console.log("not hover");
    $('#research-bar .research-bar-box i.fa.fa-rocket').removeClass("color-wavestone").addClass("color-grey");
    findParams = new URLSearchParams(window.location.search);
    getLevel = findParams.get('level');
    console.log(getLevel);
    if (getLevel == "1") {
      $('#research-bar .research-bar-box a#rocket-1 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
    } else if (getLevel == "2") {
      $('#research-bar .research-bar-box a#rocket-1 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-2 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
    } else if (getLevel == "3") {
      $('#research-bar .research-bar-box a#rocket-1 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-2 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-3 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
    } else if (getLevel == "4") {
      $('#research-bar .research-bar-box a#rocket-1 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-2 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-3 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
      $('#research-bar .research-bar-box a#rocket-4 i.fa.fa-rocket').removeClass("color-grey").addClass("color-wavestone");
    }
  }
);


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
