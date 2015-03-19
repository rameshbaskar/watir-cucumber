module GoogleHomePage
  @browser = Browser.instance
  @tb_search = @browser.text_field(name: 'q')
  @btn_search = @browser.button(name: 'btnG')

  def self.visit
    @browser.goto('http://www.google.com.sg')
  end

  def self.visit_invalid_page
    @browser.goto('http://test.test')
  end

  def self.loaded?(timeout = nil)
    Browser.exists?(@tb_search, timeout)
  end

  def self.search_for(text)
    if loaded?
      @tb_search.set(text)
      @btn_search.click
    else
      raise_error('Google home page not loaded properly')
    end
  end

  def self.searched?(text)
    @tb_search.value == text
  end
end
