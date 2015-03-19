class Database < ActiveRecord::Base
  self.abstract_class = true

  begin
    self.establish_connection(
        host: TestManager.database_host,
        port: TestManager.database_port,
        name: TestManager.database_name,
        username: TestManager.database_username,
        password: TestManager.database_password
    )
  rescue Exception => exception
    raise "Unable to connect to the database due to: #{exception.message}"
  end
end
