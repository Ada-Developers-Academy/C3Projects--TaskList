require "sinatra"
require "sinatra/reloader"
require "./lib/database"
require './lib/taskmaster'


class Site < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    the_database = TaskList::TaskMaster.new("tasklist.db") # opens communication with the database
    @all_tasks = the_database.get_all_tasks
    puts @all_tasks.class
    erb :tasks
  end

  get "/create_tasks" do
    erb :create_tasks
  end

  post "/create_tasks" do
    task = params["new_task"]
    # task variable assigned to params hash
    the_database = TaskList::TaskMaster.new("tasklist.db")
    the_database.create_tasks(task)
    # calls create_task method on the new_task array, which inherits the query method
    erb :create_tasks
  end

  get "/delete/:id" do
    erb :delete
  end

  post "/delete/:id" do
    # pulls "yes"/"no" decision from the delete confirmation page
    decision = params["decide"]
    task_id = params[:id] # is this coming from the route or from the tasks.erb delete link???

    if decision == "yes" # delete confirmation
      the_database = TaskList::TaskMaster.new("tasklist.db")
      the_database.delete_tasks(task_id)
    end
    # return to updated db on homepage
    redirect to "/"
  end

end
