Given(/^I should be able to act on two sessions at the same time$/) do
  as 'default_session' do
    puts 'Testing for default_session ...'
    GoogleHomePage.visit
    GoogleHomePage.search_for 'watir-webdriver'
    verify_true(GoogleHomePage.searched?('watir-webdriver'))
  end

  as 'new_session' do
    puts 'Testing for new_session ...'
    GoogleHomePage.visit_invalid_page
    verify_false(GoogleHomePage.loaded?(2))
  end
end
