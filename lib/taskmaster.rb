require 'sqlite3'

module TaskList
  class TaskMaster < Database

    def get_all_tasks
      query!("SELECT * FROM tasklist;")
    end

  end
end
