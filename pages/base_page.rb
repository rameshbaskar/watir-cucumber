class BasePage
  def browser
    Browser.browser
  end

  def visit(url)
    puts "Visiting URL: #{url} ..."
    browser.goto(url)
  end

  def exists?(element, timeout = nil)
    timeout ||= 20
    result = true
    begin
      element.wait_until_present(timeout)
    rescue
      result = false
    end
    result
  end
end
