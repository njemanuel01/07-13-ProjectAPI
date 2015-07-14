var req = new XMLHttpRequest();
var names = [];

req.open("get", "http://localhost:4567/projects");

req.addEventListener("load", function() {
  list_projects();
})

req.responseType = "json";
req.send();

function list_projects()
{
  var ul = document.getElementById("all_assignments");
  for (var i = 0; i < req.response.length; i++) {
    var li = document.createElement("li");
    var a = document.createElement("a");
    a.setAttribute("href", ("http://localhost:4567/projects/" + req.response[i].id));
    a.addEventListener("click", single_project)
    a.appendChild(document.createTextNode("Project Name: " + req.response[i].name));
    li.appendChild(a);
    ul.appendChild(li);
  }
}

var single_project = function() {
  var req = new XMLHttpRequest();
  
  req.open("get", this.href);

  req.addEventListener("load", function() {
    document.getElementById("title").innerHTML = req.response.name;
    document.getElementById("description").innerHTML = req.response.description;
    var ul = document.getElementById("links");
    while (ul.firstChild) {
        ul.removeChild(ul.firstChild);
    }
    for (var i = 0; i < req.response.links.length; i++) {
      var li = document.createElement("li");
      var a = document.createElement("a");
      a.setAttribute("href", req.response.links[i].link);
      a.appendChild(document.createTextNode(req.response.links[i].link));
      li.appendChild(a);
      ul.appendChild(li); 
    }
    var ul = document.getElementById("co-workers");
    while (ul.firstChild) {
        ul.removeChild(ul.firstChild);
    }
    for (var i = 0; i < req.response.members.length; i++) {
      var li = document.createElement("li");
      li.appendChild(document.createTextNode("Co-Worker: " + req.response.members[i].name));
      ul.appendChild(li); 
    }
    
  })
  event.preventDefault();
  req.responseType = "json";
  req.send();

}





