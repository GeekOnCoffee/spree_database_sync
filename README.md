SpreeDatabaseSync
=================

This extension does two simple things:
 * Adds an admin-only api call for api/database/export that provides a yaml download of your entire database
 * Uses a yaml_db task to load from url

The goal is to allow for a complete database sync (think copying your production environment to development to test)

Installation
=======
Add to your Gemfile
	gem 'spree_database_sync', :git => 'git://github.com/GeekOnCoffee/yaml_db.git'
	gem 'yaml_db', :git => 'git://github.com/GeekOnCoffee/yaml_db.git'

The dependency on a custom yaml_db repo will go away if https://github.com/ludicast/yaml_db/pull/39 is pulled into the main gem.

Example
=======

Process relies on having the proper schema in place.


	rake 'db:data:load_url[http://mystore.com/api/database/export?token=your_api_key]'


Copyright (c) 2012 [Andrew Hooker], released under the New BSD License
