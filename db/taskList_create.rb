require 'sqlite3'

db = SQLite3::Database.new "taskList.db"
db.execute "CREATE TABLE taskList(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    completed_date TEXT
  );"

db.close if db
