Apt Search Service
===

A service that checks apartment community websites for their up to date listings, availability and prices. Utilizes the Mechanize and Nokogiri libaries for webscraping

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

bin/dev
```

The server should now be running on `http://localhost:3005`

### Scraping Data

If you're forking/running this project, you should update the `target_date` inside the `scrape:start` task so that it runs properly and additionally add any scrapers that you want there.

```sh
rake scrape:start
```

### Job Scheduling

#### Production

Currently runs automattically in Production

#### Development

Use `whenever` to run a task that calls the scrapers. The schedule is in `config/schedule.rb`. Then you'll need to update your crontab:

```sh
bundle exec whenever --update-crontab
```

### Changelog

```sh
standard-changelog
```


##### github.com/avogel3
