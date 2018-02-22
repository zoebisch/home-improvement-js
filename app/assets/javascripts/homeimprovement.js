$(document).ready(function() {
});

function parseMaterial(id) {
  debugger;
  $.getJSON("/materials/" + id + "/blah", function(data) {
    // Replace text of body-id div
    debugger;
    $("#blah-" + id).html(data["name"]);
  });
  const stuff = JSON.parse(this.responseText)
  document.getElementById("stuff".innerHTML = stuff)
}
