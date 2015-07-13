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

get "/delete" do
  
  erb :delete 
end

get "/delete_do" do
  
  erb :home
end

get "/update" do
  
  erb :update
end

get "/update_do" do
  
  erb :home
end