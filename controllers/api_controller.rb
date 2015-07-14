get "/projects" do
  projects = Project.all
  array = []
  projects.each do |project|
    array << project.as_hash
  end
  json array
end

get "/project/:id" do
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
  
  x = [project.as_hash, {"links" => links_array}, {"members" => members_array}]
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

