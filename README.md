## Openclass Introduction

### Get Started

#### To bundle install

some tips from francis:

  rvm install 1.9.3
  cd re-education
  sudo apt-get install libqt4-core libqt4-ruby libpq-dev # require by capybara-webkit and pg
  sudo apt-get install imagemagick # require by simple-captcha
  gem install bundle
  cp config/database.yml.example config/database.yml # input the usename and password of your sql
  rake db:create
  rake
  rake db:migrate
  rails s

- Project management, please access http://goo.gl/ba05R
- Mockup, please access http://tuzei8.thoughtworkers.org/
