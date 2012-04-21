gem 'simple_form'

after_bundler do
  # TODO if we are installing twitter-bootstrap use add flag --bootstrap
  generate 'simple_form:install'
end

__END__

name: SimpleForm
description: Better forms for everyone.
author: plataformac

category: forms
