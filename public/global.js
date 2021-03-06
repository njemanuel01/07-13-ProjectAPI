var all_projects = function() {
  var req = new XMLHttpRequest();
  var names = [];

  req.open("get", "/projects");

  req.addEventListener("load", function() {
    for (var i = 0; i < req.response.length; i++) {
      names[i] = "Name: " + req.response[i].name; + ", ";
    }
    
    document.getElementById("content").innerHTML = names.toString();
  })

  req.responseType = "json";
  req.send();

}

var all_links = function() {
  var req = new XMLHttpRequest();
  var names = [];

  req.open("get", "/links");

  req.addEventListener("load", function() {
    for (var i = 0; i < req.response.length; i++) {
      names[i] = "Link: " + req.response[i].link; + ", ";
    }
    
    document.getElementById("content").innerHTML = names.toString();
  })

  req.responseType = "json";
  req.send();
}

var all_members = function() {
  var req = new XMLHttpRequest();
  var names = [];

  req.open("get", "/members");

  req.addEventListener("load", function() {
    for (var i = 0; i < req.response.length; i++) {
      names[i] = "Co-Worker: " + req.response[i].name; + ", ";
    }
    
    document.getElementById("content").innerHTML = names.toString();
  })

  req.responseType = "json";
  req.send();
}

var single_project = function() {
  var req = new XMLHttpRequest();
  var id = document.getElementById("id").value.charAt(0);
  var links = [];
  var members = [];
  
  req.open("get", "/project/" + id);

  req.addEventListener("load", function() {
    for (var i = 0; i < req.response[1].links.length; i++) {
      links[i] = req.response[1].links[i].link + ", ";
    }
    for (var i = 0; i < req.response[2].members.length; i++) {
      members[i] = req.response[2].members[i].member + ", ";
    }
    var text = "Name: " + req.response[0].name + ", Description: " + req.response[0].description + ", Links: " + links.toString() + ", Members:" + members.toString();
    document.getElementById("content").innerHTML = text;
  })

  req.responseType = "json";
  req.send();

}


window.onload = function() {
  document.getElementById("all_projects").addEventListener("click", all_projects);
  document.getElementById("all_links").addEventListener("click", all_links);
  document.getElementById("all_members").addEventListener("click", all_members);
  document.getElementById("single_project").addEventListener("click", single_project);
  
}

