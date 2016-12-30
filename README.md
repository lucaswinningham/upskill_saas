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
(Make sure you are in your application directory. Use the cd commands.)
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
(Make sure you are in your application directory. Use the cd commands.)
git remote add origin git@github.com:your_git_username/upskill_saas_tutorial.git
git remote
git remote -v
git push origin master
```

### 14. Gemfile Changes

Terminal
```sh
(To make sure you are in your Rails application folder, type...)
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