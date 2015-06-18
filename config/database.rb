class Database < ActiveRecord::Base
  self.abstract_class = true

  begin
    self.establish_connection(
        host: TestManager.db_host,
        port: TestManager.db_port,
        name: TestManager.db_name,
        username: TestManager.db_username,
        password: TestManager.db_password
    )
  rescue => exception
    raise "Unable to connect to the database due to: #{exception.message}"
  end
end
