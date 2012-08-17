gem 'cucumber-rails', :group => [:test]
gem 'capybara', :group => [:test]
gem 'database_cleaner', :group => [:test]

after_bundler do
  generate "cucumber:install --capybara#{' --rspec' if recipes.include?('rspec')}#{' -D'}"
end

__END__

name: Cucumber
description: "Use Cucumber for integration testing with Capybara."
author: mbleigh

exclusive: acceptance_testing 
category: testing
tags: [acceptance]
