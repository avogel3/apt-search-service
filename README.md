Apt Search Service
===

A service that checks apartment community websites for their up to date listing, availability and prices. Utilizes the Mechanize and Nokogiri libaries for webscraping

## Project Setup

### Install Depedencies

```sh
asdf install ruby 3.0.1
gem install bundler
bundle install
```

### Create/Migrate the Database

```sh
bundle exec rails db:create db:migrate
```

### Start the Development Server

```sh
gem install foreman

# optionally reshim if needed
asdf reshim ruby

foreman start -f Procfile.dev
```

The server should now be running on `http://localhost:3005`

##### github.com/avogel3
