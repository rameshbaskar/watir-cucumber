require File.join(pages_dir, 'base_page.rb')
Dir.glob(File.join(pages_dir, '**', '*.rb')).each do |file|
  require file unless file.include?('base_page.rb')
end

$browser = Watir::Browser.new

$google_home_page = GoogleHomePage.new($browser)
