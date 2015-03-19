module CommonUtils
  def raise_error(message)
    Browser.save_screenshot
    raise "#{message} !!! Please refer to the above screenshot for more details."
  end

  def all_params(table = {})
    table = table.symbolize_keys
    table = $current_example.merge(table) unless $current_example.nil?
    table
  end

  def current_time
    Time.now.strftime('%Y%m%d%H%M%s').to_s
  end
end
