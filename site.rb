require "sinatra"
require "sinatra/reloader"
require './lib/database'
require './lib/taskmaster'


  class Site < Sinatra::Base
    register Sinatra::Reloader

    get "/" do
      # @all_tasks = TaskList::TaskMaster.get_all_tasks
      erb :tasks
    end

  end
