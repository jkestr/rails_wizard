gem 'vlad', :require => false, :group => [:development]
gem 'vlad-git', :require => false, :group => [:development]

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

copy_file "vlad/vlad.rake", "config/deploy.rb"

__END__

name: Vlad
description: Deploy to servers!
author: Seattle.rb

category: server
