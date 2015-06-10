require "sinatra"
require "sinatra/reloader"

# module TaskList
  class Site < Sinatra::Base
    register Sinatra::Reloader

    get "/" do
      erb :tasks # need to create tasks.erb view and then create_task.erb also
    end

  end
# end
