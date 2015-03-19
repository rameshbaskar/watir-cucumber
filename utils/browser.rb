module Browser
  @browser = nil

  def self.instance
    return @browser unless @browser.nil?
    puts 'Launching a new browser instance...'
    @browser = Watir::Browser.new
  end

  def self.close
    puts 'Closing browser...'
    @browser.close
    @browser = nil
  end

  def self.reset
    sleep_for 1
    @browser.goto('about:blank')
    @browser.cookies.clear
    sleep_for 1
  end

  def self.url
    @browser.url
  end

  def self.save_screenshot
    begin
      file_path = screenshot_file_path
      puts "\nScreenshot path: #{file_path}\n\n"
      @browser.screenshot.save(file_path)
      puts "\nCurrent URL: #{url}\n\n"
    rescue Exception => exception
      puts "Unable to take screenshot due to: #{exception.message}"
    end
  end

  def self.exists?(element, timeout = nil)
    timeout ||= 10
    begin
      return element.wait_until_present(timeout)
    rescue Exception => exception
      puts exception.message
      return false
    end
  end
end
