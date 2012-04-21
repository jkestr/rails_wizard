after_bundler do
  run("rm public/index.html")
  run("mkdir -p app/views/application")
  remove_file 'public/images/rails.png'
  # copy favicon from templates dir
  create_file "app/views/application/index.html.haml", <<-RUBY
%section
  %h1 Welcome!
  RUBY

  inject_into_file("config/routes", 
                   :after => "# root :to => 'welcome#index'", 
                   "root :to => 'application#index'")
  
end

__END__

name: Default welcome page
description: Creates a mock landing page at Application#index
author: Jacob Basham
