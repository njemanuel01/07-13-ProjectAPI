get "/projects" do
  projects = Project.all
  
  json projects
end
