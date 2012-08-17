gem 'rack-google-analytics'

after_bundler do
  analytics = %Q{
  # Enable Google Analytics tracking
  # Replace UA- with clients property id from Google Analytics
  # config.middleware.use("Rack::GoogleAnalytics", :tracker => "UA-0000000-1")
  }

  insert_into_file("config/environments/production.rb", 
                   analytics, 
                   :before => /# Code is not reloaded between requests/)
end

__END__

name: Google Analytics
description: Add Google analytics in the stack
author: idk

category: javascript
