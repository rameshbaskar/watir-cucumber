class GoogleHomePage < BasePage
  def initialize(browser)
    @browser = browser
    @tb_search = @browser.text_field(name: 'q')
    @btn_search = @browser.button(name: 'btnG')
  end

  def visit
    @browser.goto('http://www.google.com.sg')
  end

  def loaded?
    exists? @tb_search
  end

  def search_for(text)
    if loaded?
      @tb_search.set(text)
      @btn_search.click
    else
      raise_error('Google home page not loaded properly')
    end
  end

  def searched?(text)
    @tb_search.value == text
  end
end
