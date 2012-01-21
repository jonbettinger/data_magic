class TestClass
  include DataMagic
end


Given /^I have read the yaml file$/ do
  DataMagic.load "example.yml"
end

When /^I ask for the data for "(.+)"$/ do |key|
  @data = TestClass.new.data_for key
end


Then /^the value for "(.+)" should be "(.+)"$/ do |key, value|
  @data[key].should == value
end

Then /^the value for "(.+)" should be (\d+) word|words long$/ do |key, length|
  @data[key].split(' ').size.should == length.to_i
end

Then /^the value for "(.+)" should have a minimum of (\d+) words$/ do |key, length|
  @data[key].split(' ').size.should >= length.to_i
end