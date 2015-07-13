require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Member
  extend DatabaseClassMethod
  include DatabaseInstanceMethod
  
  attr_reader :id, :project_id
  attr_accessor :name
  
  # Creates a new instance of the Member class.
  #
  # values = hash with id, name, and project_id
  #    - id = integer value, optional
  #    - name = string value
  #    - project_id = integer value
  #
  # Returns a Member object
  def initialize(values = {})
    @id = values["id"]
    @name = values["name"]
    @project_id = values["project_id"]
  end
  
  def as_hash
    {"id" => @id, "name" => @name, "project_id" => @project_id}
  end
  
  
end