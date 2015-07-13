require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Project
  extend DatabaseClassMethod
  include DatabaseInstanceMethod
  
  attr_reader :id, :name, :description
  
  # Creates a new instance of the Project class.
  #
  # values = hash with id, type, and description
  #    - id = integer value, optional
  #    - name = string value
  #    - description = string value
  #
  # Returns a Project object
  def initialize(values = {})
    @id = values["id"]
    @name = values["name"]
    @description = values["description"]
  end
  
  
end