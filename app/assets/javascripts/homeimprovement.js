$(document).ready(function() {
 attachListeners();
 listProjects();
});

function attachListeners(){
  $('#save').on('click', () => saveGame());
}

function saveGame() {
  console.log("first steps")
}

function listProjects() {
  var project = {
    name: "blah"
  }
  var template = Handlebars.compile(document.getElementById("project-template").innerHTML);
  var result = template(project);
  debugger;
  document.getElementsByTagName("main")[0].innerHTML += result;
}
