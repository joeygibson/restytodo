require 'json'

Given(/^the app is listening on port (\d+)$/) do |port|
    eventually(timeout: 10) {
        @output = %x{nc -z prodserver #{port}}
        @rc = $?
    }
end

Then(/^it should succeed$/) do
    expect(@rc).to be_success
end

Then(/^it should fail$/) do
    expect(@rc).not_to be_success
end

When(/^I get (.+) on port (\d+)$/) do |url, port|
    eventually(timeout: 10) {
        @output = %x{curl -f prodserver:#{port}#{url} 2> /dev/null}
        @rc = $?
    }
end

Then(/^the output should be \"(.+)\"$/) do |expected|
    expect(@output.strip).to eq(expected)
end

Then(/^the output should contain \"(.+)\"$/) do |expected|
  expect(@output.strip).to include(expected)
end

Then(/^the output should contain all of these:$/) do |table|
  table.raw.flatten.each do |string|
    expect(@output).to include(string)
  end
end

Then(/^there should be (\d+) todos$/) do |expected|
    hash = JSON.parse(@output)
    expect(hash.length).to eq(expected)
end

Then(/^there should be 1 todo with id (\d+)$/) do |expected|
    hash = JSON.parse(@output)
    expect(hash["id"]).to eq(expected)
end

Given(/^a JSON document with:$/) do |jsonString|
  @json = jsonString
end

When(/^I post it to (.+) on port (\d+)$/) do |url, port|
  @output = %x{curl -f -H "Content-Type: application/json" -d '#{@json}' prodserver:#{port}#{url} 2> /dev/null}
  @rc = $?
end

Then(/^the id of the todo should be (\d+)$/) do |expected|
  hash = JSON.parse(@output)
  expect(hash["id"]).to eq(expected)
end

Then(/^it should succeed with \"(.+)\"$/) do |expected|
  send "it should succeed"
  send "the output should contain :expected", expected
end

Then(/^it should succeed with:$/) do |table|
  send "it should succeed"
  send "the output should contain all of these:", table
end

Then(/^it should fail with \"(.+)\"$/) do |expected|
  send "it should fail"
  send "the output should contain :expected", expected
end
