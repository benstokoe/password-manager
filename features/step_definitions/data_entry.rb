When(/^I fill in the add password information (.*)(.*)$/) do |name, password|
  fill_in('site_name', :with => name)
  fill_in('password', :with => password)
end