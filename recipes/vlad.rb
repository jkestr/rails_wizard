gem 'vlad', :require => false, :group => [:development]
gem 'vlad-git', :require => false, :group => [:development]

after_bundler do
  
  rakefile("vlad.rake") do
    <<-TASK
      begin
        require 'vlad'
        Vlad.load(:scm => :git)
      rescue LoadError
        puts "Error loading Vlad."
      end
    TASK
  end

  create_file "config/deploy.rb", <<-RUBY
    set :application, "APPLICATION_NAME"
    set :user,        "SSH_USER_NAME"
    set :domain,      "DOMAIN"
    set :repository,  "GIT_REPOSITORY"
    set :rails_env,   "production"

    namespace :vlad do
      task :deploy => [
        :update,
        :bundle,
        :cleanup
      ]  
    end
  RUBY
  
end



__END__

name: Vlad
description: Deploy to servers!
author: Seattle.rb

category: server
