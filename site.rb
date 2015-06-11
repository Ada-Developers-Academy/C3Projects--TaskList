require "sinatra"
require "sinatra/reloader"
require "./lib/database"
require "./lib/taskmaster"



class Site < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    the_database = TaskList::TaskMaster.new("tasklist.db")
    @all_tasks = the_database.get_all_tasks
    erb :tasks
  end

  get "/create_tasks" do
    erb :create_tasks
  end

  post "/create_tasks" do
    erb :create_tasks
  end


end
