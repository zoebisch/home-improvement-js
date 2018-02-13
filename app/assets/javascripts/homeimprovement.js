$(document).ready(function() {
 attachListeners();
});

function attachListeners(){
  $('#save').on('click', () => saveGame());
}

function saveGame() {
  console.log("first steps")
}
