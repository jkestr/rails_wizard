gem 'bourbon'

after_bundler do
  generate("bootstrap:install")
  run("rm app/views/layouts/application.html.erb")
  generate("bootstrap:layout application fixed")
  
  # TODO move app/asseets/stylesheeets/application.css to application.css.scss
end

__END__

name: Bourbon
description: SASS Helpers
author: thoughtbot

category: css
