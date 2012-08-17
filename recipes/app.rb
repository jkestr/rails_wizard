after_bundler do

  # Remove the static rails index page
  run("rm public/index.html")

  # Create shared application views
  run("mkdir -p app/views/application")

  run("mkdir -p app/views/welcome")

  # Remove this rails icon thing
  remove_file 'public/images/rails.png'

  # copy favicon from templates dir

  create_file "app/controllers/welcome_controller.rb", <<-RUBY
class WelcomeController < ApplicationController
end
  RUBY

  create_file "app/views/welcome/index.html.haml", <<-RUBY
%section
  %h1 Welcome!
  RUBY

  gsub_file 'config/routes.rb', 
            "# root :to => 'welcome#index'",
            "root :to => 'welcome#index'"
  
end

__END__

name: Sets up our application structure and defaults
description: Creates a mock landing page at Application#index
author: Jacob Basham
