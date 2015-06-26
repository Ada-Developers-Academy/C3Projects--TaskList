require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name

    def initialize(database_name)
      @database_name = "db/#{ database_name }"
    end

    private

    def query!(statement, *params)
      db = SQLite3::Database.new database_name
      # .new in this case makes new instance of database connection or opens it
      db.execute statement, params
      # above is sql instructions executing the statements we pass
    rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db
    end
  end
end
