Given(/^I visit the google home page$/) do
  puts 'Launching the Google home page...'
  GoogleHomePage.visit
end

Given(/^I open a blank browser$/) do
  puts 'Launching a blank browser...'
  GoogleHomePage.visit_invalid_page
end
