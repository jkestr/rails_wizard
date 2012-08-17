gem 'selectivizer-rails'

# TODO We want to add this in an ie IE LT 9 block
after_bundler do
  analytics = %Q{
  config.assets.precompile += %w( selectivizer.js )
  }

  insert_into_file("config/environments/production.rb", 
                   analytics, 
                   :after => /# config.assets.precompile += %w( search.js )/)
end

__END__

name: Selectivizer Rails
description: Add Selectivizer to the assets chain
author: Jacob Basham

category: javascript
