Then(/^I should see '(.*)'$/) do |text|
  page.should have_content text
end

Then(/^I should see:$/) do |table|
  messages = table.raw.flatten.collect { |cell| cell }

  messages.each do |message|
    page.should have_content message
  end
end

Then(/^I should not be able to see (.*)$/) do |text|
  page.should_not have_content text
end

Then(/^I should see an error message '(.*)'$/) do |error|
	page.should have_content error
end