require "sinatra"
require "sinatra/reloader"
require "./lib/database"
require './lib/taskmaster'


class Site < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    the_database = TaskList::TaskMaster.new("tasklist.db") # opens communication with the database
    @all_tasks = the_database.get_all_tasks
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

  post "/delete" do
    # create delete confirm page, make a form to post delete command, which executes a sql delete statement
    task_id = params["new_task"]["id"]
    the_database = TaskList::TaskMaster.new("tasklist.db")
    the_database.delete_tasks(task_id)
    erb :tasks
  end
end
