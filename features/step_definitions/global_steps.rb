Given /^I have a ([^\"]*) with ([^\"]*) "([^\"]*)"$/ do |klass, method, value|
  eval("#{klass.camelize}.create(:#{method} => '#{value}')")
end

Given /^I have a ([^\"]*) with ([^\"]*) "([^\"]*)" and ([^\"]*) "([^\"]*)"$/ do |klass, method, value, method2, value2|
  eval("#{klass.camelize}.create(:#{method} => '#{value}', :#{method2} => #{value2})")
end

When /^I POST to "(.*).json" with body "(.*)"$/ do |path, body|
  post "#{path}.json", body, :content_type => 'application/json'
end

When /^I PUT to "(.*).json" with body "(.*)"$/ do |path, body|
  put "#{path}.json", body, :content_type => 'application/json'
end

When /^I GET from "(.*).json"$/ do |path|
  get "#{path}.json", :content_type => 'application/json'
end

Then /^I should get a (\d+) ([\w\s]+) response$/ do |code, name|
  @response.code.should == code
end

Then /^the "(.*)" header should be "(.*)"$/ do |header_name, expected_value|
  @response.headers[header_name].should == expected_value
end
