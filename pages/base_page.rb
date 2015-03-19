class BasePage
  def exists?(element)
    begin
      return element.wait_until_present
    rescue Exception => exception
      puts exception.message
      return false
    end
  end
end
