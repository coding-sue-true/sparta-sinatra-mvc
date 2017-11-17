require "sinatra"
require "sinatra/reloader" if development?
require_relative "./controllers/photos_controller.rb"


run PhotosController
