Given('I am a guest') do
  # NOOP
end

When('I view the home page') do
   visit '/'
end

Then('then') do
end

Then('I see {string}') do |string|
  page.must_have_content string
end

