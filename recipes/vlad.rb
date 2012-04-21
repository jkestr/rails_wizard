gem_group :development do
  gem 'vlad', :require => false
  gem 'vlad-git', :require => false
end

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

create_file "config/deploy.rb" do
  <<-RUBY
    set :application, "APPLICATION_NAME"
    set :user,        "SSH_USER_NAME"
    set :domain,      "DOMAIN"
    set :repository,  "GIT_REPOSITORY"
    set :rails_env,   "production"
    
    namespace :vlad do
      
      task :deploy => [
        :'maintenance:on',
        :update,
        :bundle,
        :migrate,
        :'maintenance:off',
        :cleanup
      ]  
      
      remote_task :bundle do
        run("cd #{current_directory} && RAILS_ENV=#{rails_env} rake bundle install --deployment")
      end
      
      remote_task :migrate do
        run("cd #{current_directory} && RAILS_ENV=#{rails_env} rake db:autoupgrade")
      end
      
      namespace :maintenance do
        remote_task :on, :roles => :web do
          run("cp #{current_path}/public/503.html #{current_path}/public/system/maintenance.html")
        end

        remote_task :off, :roles => :web do
          run("rm -f #{current_path}/public/system/maintenance.html")
        end                                                                                                                                                                                         
      end
      
    end
  RUBY
end

__END__

name: Vlad
description: Deploy to servers!
author: Seattle.rb

category: server
