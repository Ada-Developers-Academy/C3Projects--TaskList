require 'sqlite3'

module TaskList
  class TaskMaster < Database

    def get_all_tasks
      query!("SELECT * FROM tasklist;")
    end

    def create_tasks(arguments)
      query!(
        "INSERT INTO tasklist (name, description, completed_date) VALUES (#{arguments});")
    end

  end
end
