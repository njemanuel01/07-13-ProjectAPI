get "/projects" do
  projects = Project.all
  array = []
  projects.each do |project|
    array << project.as_hash
  end
  json array
end

get "/project/:id" do
  project = Project.find(params["id"])
  links = Link.where("project_id", params["project"]["id"])
  members = Member.where("project_id", params["project"]["id"])
  
  json [project, links, members]
end
