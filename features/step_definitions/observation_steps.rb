Then(/^I should see '(.*)'$/) do |text|
  fail "Could not find text: " + text unless page.has_content? text
end
Then(/^I should see:$/) do |table|
  messages = table.raw.flatten.collect { |cell| cell }

  messages.each do |message|
    fail "Cannot find text: " + message unless page.has_content? message
  end
end