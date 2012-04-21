gem 'dm-devise'

after_bundler do
  generate 'devise:install'
  generate 'devise administrator'
end

__END__

name: Devise
description: Utilize Devise for authentication, automatically configured for your selected ORM.
author: mbleigh

category: authentication
exclusive: authentication
