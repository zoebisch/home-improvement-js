$(document).ready(function() {
});

function parseMaterial(id) {
  debugger;
  $.getJSON("/materials/" + id + "/blah", function(data) {
    // Replace text of body-id div
    debugger;
    $("#blah-" + id).html(data["name"]);
  });
  let testMaterial = new Material('test_material', '2');
  var blah = testMaterial.makeLink;
  debugger;
  const stuff = JSON.parse(this.responseText)
  document.getElementById("stuff".innerHTML = stuff)
}

function Material(name, quantity_on_hand) {
  this.name = name;
  this.quantity_on_hand = quantity_on_hand;
}

Material.prototype.makeLink = function(){
  return this.name + " " + this.quantity_on_hand
}
