after_bundler do
              
  inject_into_file "config/environment/development.rb", 
                  :after => "config.action_mailer.raise_delivery_errors = false" do <<-YAML
      # Default host for mailer routes
      config.action_mailer.default_url_options = { :host => 'localhost:3000' }
   YAML
  end

end