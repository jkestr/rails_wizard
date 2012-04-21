# https://github.com/seyhunak/twitter-bootstrap-rails
gem 'twitter-bootstrap-rails'

after_bundler do
  generate("bootstrap:install")
  run("rm app/views/layouts/application.html.erb")
  generate("bootstrap:layout application fixed")
end

__END__

name: Twitter Bootstrap
description: Javascript and styles
author: Twitter

category: javascript
