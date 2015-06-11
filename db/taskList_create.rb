require 'sqlite3'

db = SQLite3::Database.new "tasklist.db"
db.execute "CREATE TABLE tasklist(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    completed_date TEXT
  );"

db.execute "INSERT INTO tasklist (id, name) VALUES (1, 'testy');"

puts *db
# display database somehow


db.close if db
