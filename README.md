# README

[Upskill](http:upskillcourses.com) Software-as-a-Service Ruby on Rails App

### 6. Changing Directories and Starting with a Clean Slate in Cloud9

Terminal
```sh
cd
rm -r workspace
ls
mkdir workspace
cd workspace
clear
```

### 7. Install Ruby and Rails with RVM

Terminal
```sh
cd
cd workspace
rvm install 2.3.0
rvm --default use 2.3.0
rvm gemset list
rvm gemset create saasapp
rvm gemset list
rails -v
rvm --default use ruby-2.3.0@saasapp
gem install rails -v 5.0.0 --no-ri --no-rdoc
ruby -v
rails -v
rvm --default use ruby-2.3.0@saasapp
rails new saasapp
cd saasapp
touch .rvmrc
c9 .rvmrc
```

.rvmrc
```sh
rvm use 2.3.0@saasapp
```

Terminal
```sh
cd ..
cd saasapp
y
rvm rvmrc to .ruby-version
rm .rvmrc
```

### 9. Initialize Git to Track Changes

Terminal
```sh
git config --global user.name "First Last"
git config --global user.email your.email@address.com
cd
cd workspace
cd saasapp
c9 README.md
```
Change README

Terminal
```sh
cd
cd workspace/saasapp
git init
git add .
git status
git commit -m "Initial commit"
```

### 11. SSH Keys Will Link Cloud9 to GitHub

Terminal
```sh
cat ~/.ssh/id_rsa.pub
```
Copy the output to your SSH keys page in your Github settings.

Terminal
```sh
cd
cd workspace/saasapp
git remote add origin git@github.com:your_git_username/upskill_saas_tutorial.git
git remote
git remote -v
git push origin master
```

### 14. Gemfile Changes

Terminal
```sh
cd
cd workspace/saasapp
git checkout -b pages_and_layout
```

Change Gemfile

Terminal
```sh
git status
git add .
git commit -m "Updated Gemfile for consistency"
git push origin pages_and_layout
```

### 16. Creating a Home Page

Terminal
```sh
cd
cd workspace/saasapp
touch app/controllers/pages_controller.rb
```

app/controllers/pages_controller.rb
```sh
class PagesController < ApplicationController
  def home
  end
end
```

Terminal
```sh
mkdir app/views/pages
touch app/views/pages/home.html.erb
```

app/views/pages/home.html.erb
```sh
<h2>Home Page</h2>
```

config/routes.rb
```sh
root to: 'pages#home'
```

Terminal
```sh
git add .
git status
git commit -m "Added a home view, controller action, route"
git push origin pages_and_layout
```

### 18. Adding Custom Google Fonts

app/views/layouts/application.html.erb
```sh
<!DOCTYPE html>
<html>
  <head>
...
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700,800" rel="stylesheet">
...
  </head>
...
```

app/assets/stylesheets/application.css
```sh
h1, h2, h3 {
  font-family: 'Open Sans', sans-serif;
}
```

Terminal
```sh
cd
cd workspace/saasapp
git status
git add .
git commit -m "Added custom Google fonts"
git push origin pages_and_layout
```

### 20. Adding an About Page

app/controllers/pages_controller.rb
```sh
...
def about
end
...
```

Terminal
```sh
cd
cd workspace/saasapp
touch app/views/pages/about.html.erb
```

app/views/pages/about.html.erb
```sh
<h2>About Page</h2>
```

config/routes.rb
```sh
...
get 'about', to: 'pages#about'
...
```

app/views/layouts/application.html.erb
```sh
...
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,700,800" rel="stylesheet">
...
```

Terminal
```sh
git status
git add .
git commit -m "Added about view, route, controller action"
git push origin pages_and_layout
```

### 22. Twitter Bootstrap Makes Our Site Look Good

Gemfile
```sh
...
# Use Twitter Bootstrap library for front-end UI and layout
gem 'bootstrap-sass', '3.3.7'
...
```
We renamed our application.css file to application.css.scss

app/assets/stylesheets/application.css.scss
```sh
@import 'bootstrap-sprockets';
@import 'bootstrap';
```

app/views/layouts/application.html.erb
```sh
<!DOCTYPE html>
<html>
  <head>
...
  </head>
  <body>
...
    <div class="container">
      <%= yield %>
    </div>
...
  </body>
</html>
```

Terminal
```sh
cd
cd workspace/saasapp
git status
git add .
git commit -m "Added bootstrap gem"
git push origin pages_and_layout
```

### 24. Bootstrap Navbar

app/views/layouts/application.html.erb
```sh
<!DOCTYPE html>
<html>
  <head>
...
  </head>
  <body>
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
      <div class='container'>
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="/" class="navbar-brand">SaaS</a>
        </div>
        <div class="collapse navbar-collapse" id="main-nav-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/about">About</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div>
    </nav>
...
  </body>
</html>
```

Terminal
```sh
cd
cd workspace/saasapp
git status
git add .
git commit -m "Added navbar to layout"
git push origin pages_and_layout
```

### 25. Background Gradient

app/assets/stylesheets/application.css.scss
```sh
...
body, .navbar {
  //Gradient provided by @_ighosh at uiGradients.com
  background: #00c6ff; /* fallback for old browsers */
  background: -webkit-linear-gradient(to left, #00c6ff , #0072ff); /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to left, #00c6ff , #0072ff); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
.navbar {
  border: none;
}
```

Terminal
```sh
cd
cd workspace/saasapp
git status
git add .
git commit -m "Added gradient background"
git push origin pages_and_layout
```

### 27. Improving the Home Layout

app/views/pages/home.html.erb
```sh
<div class="home-callout text-center container-fluid">
  <h1>Welcome to DevMatch</h1>
  <h3>A membership site where entrepreneurs can meet developers.</h3>
</div>
```

app/views/layouts/application.html.erb
```sh
...
<%= yield %>
```

app/assets/stylesheets/application.css.scss
```sh
...
.navbar, .home-callout {
...
.home-callout {
  color: white;
  margin-top: -20px;
  padding-top: 50px;
  padding-bottom: 100px;
}
```

Terminal
```sh
cd
cd workspace/saasapp
git status
git add .
git commit -m "Modified home callout CSS"
git push origin pages_and_layout
```

### 29. Navbar Text Color

app/assets/stylesheets/application.css.scss
```sh
...
.navbar-default .navbar-brand {
  color: white;
}
.navbar-default .navbar-nav > li > a {
  color: white;
}
.navbar-default .navbar-brand:hover {
  color: white;
  opacity: 0.75;
}
.navbar-default .navbar-nav > li > a:hover {
  color: white;
  opacity: 0.75;
}
...
```

Terminal
```sh
cd
cd workspace/saasapp
git status
git add .
git commit -m "Updated navbar styles"
git push origin pages_and_layout
```

### 31. Refactor CSS with SCSS

app/assets/stylesheets/application.css.scss
```sh
...
// Typography Styles
h1, h2, h3 {
  font-family: 'Open Sans', sans-serif;
}
// Background Gradient
.navbar, .home-callout {
  /* Gradient provided by @_ighosh at uiGradients.com */
  background: #00c6ff; /* fallback for old browsers */
  background: -webkit-linear-gradient(to left, #00c6ff , #0072ff); /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to left, #00c6ff , #0072ff); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
// Nav Styles
.navbar {
  border: none;
}
.navbar-default .navbar-brand,
.navbar-default .navbar-nav > li > a {
  color: white;
  &:hover {
    color: white;
    opacity: 0.75;
  }
}
// Home Page Styles
.home-callout {
  color: white;
  margin-top: -20px;
  padding-top: 50px;
  padding-bottom: 100px;
}
```

Terminal
```sh
cd
cd workspace/saasapp
git status
git add .
git commit -m "Refactored with Sass"
git push origin pages_and_layout
```

### 33. Font Awesome for Icons

Gemfile
```sh
...
# Use Font Awesome sass gem for adding icons
gem 'font-awesome-sass', '4.6.2'
...
```

Terminal
```sh
cd
cd workspace/saasapp
bundle install
```

app/assets/stylesheets/application.css.scss
```sh
...
@import "font-awesome-sprockets";
@import "font-awesome";
...
```

app/views/layouts/application.html.erb
```sh
...
<a href="/" class="navbar-brand"><i class="fa fa-group"></i> DevMatch</a>
...
```

Terminal
```sh
git status
git add .
git commit -m "Added font awesome gem"
git push origin pages_and_layout
```