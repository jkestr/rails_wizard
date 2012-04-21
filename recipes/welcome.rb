after_bundler do
  run("rm public/index.html")
  
  create_file "app/views/application/index.html.haml", <<-RUBY
    %section
      %h1 Welcome!
  RUBY

  replace_in_file "config/routes.rb", 
                  "# root :to => 'welcome#index'", 
                  "root :to => 'application#index"
  
end

__END__

name: Default welcome page
description: Creates a mock landing page at Application#index
author: Jacob Basham
