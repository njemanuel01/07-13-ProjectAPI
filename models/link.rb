require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Link
  extend DatabaseClassMethod
  include DatabaseInstanceMethod
  
  attr_reader :id, :link, :project_id
  
  # Creates a new instance of the Link class.
  #
  # values = hash with id, link, and project_id
  #    - id = integer value, optional
  #    - link = string value
  #    - project_id = intger value
  #
  # Returns a Project object
  def initialize(values = {})
    @id = values["id"]
    @link = values["link"]
    @project_id = values["project_id"]
  end
   
end