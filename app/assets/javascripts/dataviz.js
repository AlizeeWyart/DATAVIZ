if ($('#before-results .card-graph').length % 3 != 0) {
  console.log("il faut en rajouter");
  $('#before-results').append("<div class=\"card-graph\" style=\"opacity:0\"></div>")
}
