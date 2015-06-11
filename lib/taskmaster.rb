require 'sqlite3'

module TaskList
  class TaskMaster < Database

    def get_all_tasks
      query!("SELECT * FROM tasklist;")
    end

    def create_tasks(task)
      # task( [name, desc, date] )

      # something incorrect with params and how we're referencing them.  probably interpolation.
      query!("INSERT INTO tasklist (name, description, completed_date) VALUES ('#{task['name']}', '#{task['description']}', '#{task['date']}');")
      #mquery!("INSERT INTO tasklist (name, description, completed_date) VALUES (ronnie, 'asdf', '');")

    end

  end
end
