Then(/^I should be able to search for '(.*)'$/) do |search_text|
  puts "Searching for '#{search_text}' ..."
  GoogleHomePage.search_for search_text

  puts 'Verifying if search is successful...'
  verify_true(GoogleHomePage.searched?(search_text))
end

Then(/^I should not be able to search for '(.*)'$/) do |search_text|
  puts "Verifying if the user is not able to search for #{search_text}"
  verify_false(GoogleHomePage.loaded?(2))
end
