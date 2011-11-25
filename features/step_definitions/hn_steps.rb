# hn_steps.rb

And /^debug$/ do
  debugger
  p 'debugger called'
end

And /^saop$/ do
  save_and_open_page
end
