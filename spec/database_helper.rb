require_relative '../lib/database_connection'

def reset_test_database
  DatabaseConnection.query("TRUNCATE users, peeps;")

  DatabaseConnection.query("INSERT INTO users(id, name, username, email_address)
                        VALUES (1, 'Matt Hulbert', 'hulbgoblin', 'matthulbert@hotmail.com'),
                        (2, 'Paul Fazackerley', 'alittlecross', 'alittlecross@live.com'),
                        (3, 'Dana Gajewska', 'danusia.x', 'danusia.x@outlook.com');")

  DatabaseConnection.query("INSERT INTO peeps(user_id, content, timestamp)
              VALUES (1, 'May Day is approaching', '2018-11-23 10:27:28'),
              (2,'What?!', '2018-11-23 10:20:28'),
              (3, 'Hello Chitter!', '2018-11-23 10:30:28');")
end

def persisted_data(table:, id:)
  result = DatabaseConnection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end
