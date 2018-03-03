$(document).ready(function() {
});

function parseMaterial(json) {
  let testMaterial = new Material(json);
  var newMaterial = testMaterial.renderLI();
  $("#new_material").prepend(newMaterial);
}

$(function () {
  Material.templateSource = $("#material-template").html();
  Material.template = Handlebars.compile(Material.templateSource);
})

function Material(attributes) {
  this.id = attributes.id
  this.name = attributes.name;
  this.quantity_on_hand = attributes.quantity_on_hand;
}

Material.prototype.renderLI = function(){
  return Material.template(this);
}
