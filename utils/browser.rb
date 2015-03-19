module Browser
  @current_session = nil
  @current_key = nil
  @sessions = {}

  def self.set_current_session_as(key)
    @current_key = key
    if session_exists?(key)
      puts "Found an existing session for #{key}. Reusing the same session..."
      @current_session = @sessions[key]
    else
      puts "Looks like a browser session for #{key} is not instantiated yet. Launching a new session now..."
      @current_session = Watir::Browser.new
      sleep 1
      @current_session.goto('about:blank')
      sleep 1
      @sessions[key] = @current_session
    end
  end

  def self.browser
    raise 'No browser session available !!!' if @current_session.nil?
    @current_session
  end

  def self.goto(url)
    puts "Opening URL: #{url} ..."
    @current_session.goto url
  end

  def self.close_current_session
    puts 'Closing current browser session...'
    @current_session.close
    @sessions.delete(@current_key)
    @current_session = nil
    @current_key = nil
  end

  def self.close_all_sessions
    puts 'Closing all browser sessions...'
    @sessions.each_value { |session| session.close }
    @sessions = {}
  end

  def self.reset_all
    puts 'Resetting all browser sessions...'
    @sessions.each_value do |session|
      sleep 1
      session.goto('about:blank')
      session.cookies.clear
      sleep 1
    end
  end

  def self.url
    @current_session.url
  end

  def self.save_screenshot
    begin
      file_path = TestManager.screenshot_file_path
      puts "\nScreenshot path: #{file_path}\n\n"
      @current_session.screenshot.save(file_path)
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

  private

  def self.session_exists?(key)
    @sessions.has_key? key
  end
end
