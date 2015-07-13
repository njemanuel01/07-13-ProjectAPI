var all_projects = function() {
  var req = new XMLHttpRequest();

  req.open("get", "/projects");

  req.addEventListener("load", function() {
    for (var i = 0; i < req.response.length; i++) {
      document.getElementById("content").innerHTML = "Name: " + req.response[i].name;
    }
  })

  req.responseType = "json";
  req.send();

}

var single_project = function() {
  var req = new XMLHttpRequest();
  var id = document.getElementById("id").value.charAt(0);
  
  req.open("get", "/project/" + id);

  req.addEventListener("load", function() {
    document.getElementById("content").innerHTML = "Name: " + req.response[0].name;
  })

  req.responseType = "json";
  req.send();

}


window.onload = function() {
  document.getElementById("all_projects").addEventListener("click", all_projects);
  document.getElementById("single_project").addEventListener("click", single_project);
}

