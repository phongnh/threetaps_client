# ThreetapsClient

A very simple Rest Client for 3taps API.

## Installation

Add this line to your application's Gemfile:

    gem 'threetaps_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install threetaps_client

## Usage

Setup API key:

    ThreetapsClient.api_key = <your-api-key>

Use Search API:

    ThreetapsClient.search :source => 'CRAG', :location => { :country => 'USA' }

Use Polling API:

    # To start polling from a given point in time
    ThreetapsClient.anchor Time.now.to_i

    # Retrieves a set of new postings from the database
    ThreetapsClient.poll
    ThreetapsClient.poll(640587080)
    ThreetapsClient.poll('640587080')

Use Reference API:

    # To obtain a list of data sources
    ThreetapsClient.data_sources

    # To obtain a list of category groups
    ThreetapsClient.category_groups

    # To obtain a list of categories
    ThreetapsClient.categories

    # To obtain a list of locations by level
    # level can be 'country'|'state'|'metro'|'region'|'county'|'city'|'locality'|'zipcode'
    ThreetapsClient.locations(level) 

    # The find the details of a single location based on its 3taps location code
    ThreetapsClient.lookup_location(code)

## Contributing

1. Fork it ( http://github.com/phongnh/threetaps_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
