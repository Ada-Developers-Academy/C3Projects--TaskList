require "sinatra"
require "sinatra/reloader"
require './lib/database'
require './lib/taskmaster'


  class Site < Sinatra::Base
    register Sinatra::Reloader

    get "/" do

      # TaskList::TaskMaster.get_all_tasks
      # above def isn't working
      erb :tasks
    end

    get "/create_tasks" do
      erb :create_tasks
    end
  

  end
