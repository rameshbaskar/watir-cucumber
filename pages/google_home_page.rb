class GoogleHomePage < BasePage
  def initialize
    @tb_search = browser.text_field(name: "q")
    @btn_search = browser.button(name: "btnG")
  end

  def visit
    super("http://www.google.com.sg")
  end

  def self.visit_invalid_page
    visit("http://test.test")
  end

  def loaded?
    exists?(@tb_search)
  end

  def self.search_for(text)
    raise_error("Home page not loaded") unless loaded?
    @tb_search.set(text)
    @btn_search.click
  end

  def self.searched?(text)
    @tb_search.value == text
  end
end
