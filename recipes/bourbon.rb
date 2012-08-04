gem 'bourbon'

after_bundler do
  run("rm app/assets/stylesheets/application.css")
  create_file "app/assets/stylesheets/application.css.scss", <<-SCSS
@import 'bourbon';

// Plug and play is the name of the game.
@import 'theme/theme';
SCSS
  
  run("mkdir -p app/assets/stylesheets/theme/snippets")
  
  create_file "app/assets/stylesheets/theme/_theme.css.scss", <<-SCSS
// Overide defaults for set new variables here.

// All colors should be defined as variables in this file.
@import 'colors';

// All fonts should be defined as variables in this file
@import 'fonts'

// Manage the margins, padding, positioning and display type of the layout
@import 'layout';

// Apply defined styles into the DOM
// DO NOT use this unless your change is site wide, for specific changes see
// the section on importing theme snippets.
// @import 'default';

// Import theme snippets
// Extend the global style by creating snippets and importing them here.
// For example you could have a snippet for section.admin.people and another
// section for section.posts.
// @import 'snippets/_NAME';
// @import 'snippets/section-admin_people'


SCSS

create_file "app/assets/stylesheets/theme/_colors.css.scss", <<-SCSS
SCSS

create_file "app/assets/stylesheets/theme/_fonts.css.scss", <<-SCSS
SCSS

create_file "app/assets/stylesheets/theme/_layout.css.scss", <<-SCSS
SCSS

create_file "app/assets/stylesheets/theme/_default.css.scss", <<-SCSS
SCSS

end

__END__

name: Bourbon
description: SASS Helpers
author: thoughtbot

category: css
