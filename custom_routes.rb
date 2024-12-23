# Load the Rails environment
require_relative './config/environment'

# Iterate through routes and display only the custom ones in a tabular format
puts "HTTP Verb   Path                 Controller#Action             Named Helper"
puts "---------   ----                 -----------------             ------------"

Rails.application.routes.routes.each do |route|
  # Skip unnamed or framework-generated routes
  next if route.name.blank? || route.path.spec.to_s.include?("/rails/") || route.path.spec.to_s.include?("/turbo/")

  # Extract details
  verb = route.verb || "ANY"
  path = route.path.spec.to_s
  controller_action = "#{route.defaults[:controller]}##{route.defaults[:action]}"
  named_helper = route.name ? "#{route.name}_path" : ""

  # Print in the desired format
  puts "#{verb.ljust(10)} #{path.ljust(25)} #{controller_action.ljust(30)} #{named_helper}"
end

# to run this script, execute the following command in the terminal
#  rails runner custom_routes.rb
