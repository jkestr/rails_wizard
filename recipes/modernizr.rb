gem 'modernizr_rails', :require => 'modernizr-rails'

after_bundler do
  insert_into_file("app/assets/javascripts/application.js", 
                   "//= require modernizr\n", 
                   :before => /\/\/= require jquery\n/)
end


__END__

name: Mondernizr
description: Javascript helper
author: everyone

category: javascript
