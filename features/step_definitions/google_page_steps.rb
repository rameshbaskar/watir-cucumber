Then(/^I should be able to search for '(.*)'$/) do |search_text|
  puts "Searching for '#{search_text}' ..."
  $google_home_page.search_for search_text

  puts 'Verifying if search is successful...'
  verify_true($google_home_page.searched?(search_text))
end

Then(/^I should not be able to search for '(.*)'$/) do |search_text|
  puts "Verifying if the user is not able to search for #{search_text}"
  verify_false($google_home_page.loaded?)
end
