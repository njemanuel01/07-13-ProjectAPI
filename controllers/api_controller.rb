get "/projects" do
  projects = Projects.all
  
  json projects
end
