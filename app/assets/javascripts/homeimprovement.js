
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

  $('#filter').on("click", function(){
    $.getJSON("/materials", function(data) {
      var materialList = "";
      var filtered = data.filter((material) => material.quantity_on_hand >= 100);
      filtered.forEach(function(material) {
        materialList += '<li><a href=' + "/materials/" + material["id"] + '>' + material["name"] + " - Quantity On Hand " + material["quantity_on_hand"] + '</a></li>'
      });
      $("#materials").html("")
      $("#materials").append(materialList);
    })
  });

})

function Material(attributes) {
  this.id = attributes.id
  this.name = attributes.name;
  this.quantityOnHand = attributes.quantity_on_hand;
}

Material.prototype.renderLI = function(){
  return Material.template(this);
}
