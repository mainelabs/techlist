Techlist
========

This project aims to provide a simple way to search startups and digital companies in a city. It has been created by [Mainelabs] and [Angers technopole] developers for [Angers], France.

Feel free to use it for your own city, we'll be happy to see our work used by other organizations!


Getting Started
---------------

A few things are required on your machine before starting:

* [ruby](https://www.ruby-lang.org/) v2.3.0
* [bundler](http://bundler.io/)
* [Qt](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit) for the capybara gem.
* [PostgreSQL](http://www.postgresql.org/download/) for the pg gem. Depending on your environment, you might have some [additional libs](http://stackoverflow.com/questions/6040583/cant-find-the-libpq-fe-h-header-when-trying-to-install-pg-gem) to install. Make also sure you have created a postgres user having the same name as your OS username.

You can then execute the setup script contained in the repository:

    % ./bin/setup

Before launching the app, you should get a Google Maps API key. Everything is explained here : https://developers.google.com/maps/documentation/javascript/tutorial?hl=FR#api_key. Once this is done, you just have to add the key to your `.env` file :

```
  GOOGLE_MAPS_KEY=they_key_should_be_here
```

> Note that this step is not required : the file `.sample.env` comes with a generic key, working for the domain `localhost`. But you really should generate your own key.

After setting up, you can run the application:

    % rails server

And go check [http://localhost:3000](http://localhost:3000) in your browser.

License
-------

Techlist is released under the [MIT License].

[Mainelabs]: http://mainelabs.fr
[Angers technopole]: http://angerstechnopole.com/
[Angers]: http://angers.fr
[MIT License]: http://www.opensource.org/licenses/MIT
