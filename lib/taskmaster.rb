require 'sqlite3'

module TaskList
  class TaskMaster < Database

    def get_all_tasks
      query!("SELECT * FROM tasklist;") # (statement in parens)
    end

    def create_tasks(task)
      # task( [name, desc, date] )

      query!("INSERT INTO tasklist (name, description, completed_date) VALUES ('#{task['name']}', '#{task['description']}', '#{task['date']}');")
      # takes data from the form (parens is a string, new task is an array) and interpolates it into a dql values statement, so db can use it
    end

    def delete_tasks(task_id)
      query!("DELETE FROM tasklist WHERE id='#{task_id}';")
    end

  end
end
