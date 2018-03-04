
function parseMaterial(json) {
  Material.templateSource = $("#material-template").html();
  Material.template = Handlebars.compile(Material.templateSource);
  let testMaterial = new Material(json);
  var newMaterial = testMaterial.renderLI();
  $("#new_material").prepend(newMaterial);
}

$(function () {
  Handlebars.registerHelper('alert', function() {
    alert("material already exists")
  });
})

function Material(attributes) {
  this.id = attributes.id
  this.name = attributes.name;
  this.quantity_on_hand = attributes.quantity_on_hand;
}

Material.prototype.renderLI = function(){
  return Material.template(this);
}
