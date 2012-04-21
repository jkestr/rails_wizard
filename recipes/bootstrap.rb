gem 'twitter-bootstrap-rails'

after_bundler do
  generate("bootstrap:install")
end

__END__

name: Twitter Bootstrap
description: Javascript and styles
author: Twitter

category: javascript
