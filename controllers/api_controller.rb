get "/projects" do
  projects = Project.all
  array = []
  projects.each do |project|
    array << project.as_hash
  end
  json array
end

get "/projects/add" do
  project = Project.add({"name" => params["name"], "description" => params["description"]})
  hash = project.as_hash
  links = []
  members = []
  if params["link1"] != ""
    link = Link.add({"link" => params["link1"], "project_id" => project.id})
    links << link.as_hash
  end
  if params["link2"] != ""
    link = Link.add({"link" => params["link2"], "project_id" => project.id})
    links << link.as_hash
  end
  if params["link3"] != ""
    link = Link.add({"link" => params["link3"], "project_id" => project.id})
    links << link.as_hash
  end
  if params["member1"] != ""
    member = Member.add({"name" => params["member1"], "project_id" => project.id})
    members << member.as_hash
  end
  if params["member2"] != ""
    member = Member.add({"name" => params["member2"], "project_id" => project.id})
    members << member.as_hash
  end
  
  hash["links"] = links
  hash["members"] = members
  json hash
end

get "/projects/:id" do
  links_array = []
  members_array = []
  project = Project.find(params["id"])
  links = Link.where("project_id", params["id"])
  links.each do |link|
    links_array << link.as_hash
  end
  members = Member.where("project_id", params["id"])
  members.each do |member|
    members_array << member.as_hash
  end
  
  x = project.as_hash
  x["links"] = links_array
  x["members"] = members_array
  json x
end

get "/links" do
  links = Link.all
  array = []
  links.each do |link|
    array << link.as_hash
  end
  json array
end

get "/members" do
  members = Member.all
  array = []
  members.each do |member|
    array << member.as_hash
  end
  json array
end


get "/projects/delete/:id" do
  project = Project.find(params["id"])
  hash = project.as_hash
  links = Link.where("project_id", params["id"])
  links.each do |link|
    link.delete
  end
  members = Member.where("project_id", params["id"])
  members.each do |member|
    member.delete
  end
  project.delete
  json hash
end

