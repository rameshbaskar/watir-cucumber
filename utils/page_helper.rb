module PageHelper
  def text_field_for(options)
    Browser.browser.text_field(options)
  end

  def button_for(options)
    Browser.browser.button(options)
  end

  def link_for(options)
    Browser.browser.link(options)
  end

  def text_area_for(options)
    Browser.browser.textarea(options)
  end

  def checkbox_for(options)
    Browser.browser.checkbox(options)
  end

  def radio_for(options)
    Browser.browser.radio(options)
  end

  def element_for(options)
    Browser.browser.element(options)
  end
end
