# I18n::MongoDB

I18n MongoDB backend. Allows to store translations in a Mongo database, e.g. for providing a web-interface for managing translations.
This is not be confused with the KeyValue Backend.

## Installation

Add this line to your application's Gemfile:

    gem 'i18n-mongodb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n-mongodb

## Usage
```ruby
require 'i18n/backend/mongodb'

collection   = Mongo::Connection.new.db('test').collection('translations')
I18n.backend = I18n::Backend::MongoDB.new(collection)
```
    
You can pass a boolean value as second argument to the backend, 
to auto insert missing translations to the database

```ruby
I18n.backend = I18n::Backend::MongoDB.new(collection, true)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
