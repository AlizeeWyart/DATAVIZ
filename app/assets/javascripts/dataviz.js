if ($('#before-results .card-graph').length % 3 != 0) {
  console.log("il faut en rajouter");
  $('#before-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
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
