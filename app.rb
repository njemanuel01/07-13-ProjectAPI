require "pry"
require "sinatra"
require "sinatra/json"
require "sinatra/reloader"
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# # Models
require_relative "models/project.rb"
require_relative "models/member.rb"
require_relative "models/link.rb"

# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/api_controller.rb"