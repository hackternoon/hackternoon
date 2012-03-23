Kaminari.configure do |config|
  # I like 4 for debugging.
  # Eventually I'll set it to something larger, perhaps 100:
  config.default_per_page = 4
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
end
