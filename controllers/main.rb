get "/home" do
  erb :home
end

get "/add" do
  erb :add
end

get "/add_do" do
  project = Project.add({"name" => params["project"]["name"], "description" => params["project"]["description"]})
  if params["project"]["link1"] != ""
    link = Link.add({"link" => params["project"]["link1"], "project_id" => project.id})
  end
  if params["project"]["link2"] != ""
    link = Link.add({"link" => params["project"]["link2"], "project_id" => project.id})
  end
  if params["project"]["link3"] != ""
    link = Link.add({"link" => params["project"]["link3"], "project_id" => project.id})
  end
  if params["project"]["member1"] != ""
    member = Member.add({"name" => params["project"]["member1"], "project_id" => project.id})
  end
  if params["project"]["member2"] != ""
    member = Member.add({"name" => params["project"]["member2"], "project_id" => project.id})
  end
  erb :home
end

get "/list" do
  erb :list
end

get "/delete" do
  
  erb :delete 
end

get "/delete_do" do
  project = Project.find(params["project"]["id"])
  links = Link.where("project_id", params["project"]["id"])
  links.each do |link|
    link.delete
  end
  members = Member.where("project_id", params["project"]["id"])
  members.each do |member|
    member.delete
  end
  project.delete
  erb :home
end

get "/update" do
  
  erb :update
end

get "/update_do" do
  project = Project.find(params["project"]["id"])
  if params["project"]["name"] != ""
    project.name = params["project"]["name"]
  end
  if params["project"]["description"] != ""
    project.name = params["project"]["description"]
  end
  project.save
  erb :home
end