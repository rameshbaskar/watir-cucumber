module Browser
  DEFAULT_SESSION_KEY = "default"

  @current_session = nil
  @current_key = nil
  @sessions = {}

  def self.set_context_as(key)
    puts "Setting current session key as #{key} ..."
    @current_key = key
  end

  def self.browser
    raise "No session context set. Aborting !!!" if @current_key.nil?
    if @sessions.has_key?(@current_key)
      @current_session = @sessions[@current_key]
    else
      puts "Browser not launched yet. Launching a new session now..."
      @current_session = Watir::Browser.new(:firefox)
      @sessions[@current_key] = @current_session
    end
    @current_session
  end

  def self.close
    close_session_for @current_key
    @current_session = nil
    set_context_as DEFAULT_SESSION_KEY
  end

  def self.quit
    puts "Closing all sessions..."
    @sessions.each_value { |session| session.close unless session.nil? }
    @current_session = nil
    @current_key = nil
    @sessions = {}
  end

  def self.reset_sessions
    puts "Resetting all sessions..."
    @sessions.each_pair do |key, session|
      if key == DEFAULT_SESSION_KEY
        session.goto("about:blank")
        session.cookies.clear
      else
        close_session_for key
      end
    end
    set_context_as DEFAULT_SESSION_KEY
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

  def self.as(key)
    set_context_as key
    yield
    set_context_as DEFAULT_SESSION_KEY
  end

  private

  def self.close_session_for(key)
    puts "Closing #{key} session..."
    @sessions[key].close
    @sessions.delete(key)
  end
end
