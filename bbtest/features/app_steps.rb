Given(/^the app is listening on port (\d+)$/) do |port|
    EventuallyHelper.eventually(timeout: 10) {
        @output = %x{nc -z app #{port}}
        @rc = $?
    }
end

Then(/^it should succeed$/) do
    expect(@rc).to be_success
end

Then(/^it should fail$/) do
    expect(@rc).not_to be_failure
end

When(/^I get (.+) on port (\d+)$/) do |url, port|
    @output = %x{curl -q app:#{port}#{url}}
    @rc = $?
end

Then(/^the output should be \"(.+)\"$/) do |expected|
    expect(@output.strip).to eq(expected)
end
