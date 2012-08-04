gem 'dm-devise'
gem 'devise', '~> 2.1'

after_bundler do
  generate 'devise:install'
  generate 'devise administrator'
  
  inject_into_file "config/environments/development.rb", 
                  :after => "config.action_mailer.raise_delivery_errors = false" do <<-RUBY
      # Default host for mailer routes
      config.action_mailer.default_url_options = { :host => 'localhost:3000' }
   RUBY
  end
  
end

__END__

name: Devise
description: Utilize Devise for authentication, automatically configured for your selected ORM.
author: mbleigh

category: authentication
exclusive: authentication
