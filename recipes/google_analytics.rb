gem 'rack-google_analytics'

after_bundler do
  analytics = %Q{
    # Enable Google Analytics tracking
    # Replace UA- with clients property id from Google Analytics
    # config.middleware.use("Rack::GoogleAnalytics", :web_property_id => "UA-0000000-1")
  }
  insert_into_file("config/environments/production", analytics, :after => /config.serve_static_assets = false/)
  insert_into_file("config/environments/staging", analytics, :after => /config.serve_static_assets = false/)
end

__END__

name: Google Analytics
description: Add Google analytics in the stack
author: idk

category: javascript
