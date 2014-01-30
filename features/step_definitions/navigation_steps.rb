When(/^I am on the '(.*)' page$/) do |page_name|
	if page_name == 'home'
		visit '/'
  elsif page_name == 'passwords'
    visit '/passwords'
  end
end
When(/^I click '(.*)' button$/) do |button_text|
  click_on button_text
end