module GoogleHomePage
  def self.init
    @tb_search = text_field_for(name: 'q')
    @btn_search = button_for(name: 'btnG')
  end

  def self.visit
    Browser.goto 'http://www.google.com.sg'
    init
  end

  def self.visit_invalid_page
    Browser.goto 'http://test.test'
    init
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
