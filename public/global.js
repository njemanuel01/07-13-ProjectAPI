var all_projects = function () {
  var req = new XMLHttpRequest();

  req.open("get", "/projects");
  
  req.addEventListener("load", function () {
    alert(req.response);
  })

  req.send();
  

}

window.onload = function() {
  document.getElementById("all_projects").addEventListener("click", all_projects);
}

