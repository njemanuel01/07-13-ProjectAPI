# Creates a connection to the finance database
CONNECTION = SQLite3::Database.new("api.db")

# Makes tables
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'projects' (id INTEGER, name TEXT, description TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'members' (id INTEGER PRIMARY KEY, name TEXT, project_id INTEGER, FOREIGN KEY (project_id) REFERENCES projects(id));")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'links' (id INTEGER PRIMARY KEY, link TEXT, project_id INTEGER, FOREIGN KEY (project_id) REFERENCES projects(id));")

# Get resulst as an Array of Hashes
CONNECTION.results_as_hash = true