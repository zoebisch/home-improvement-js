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

}
