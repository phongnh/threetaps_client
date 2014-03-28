require 'json'
require 'restclient'
require "threetaps_client/version"
require "threetaps_client/core_ext"

module ThreetapsClient
  extend self

  DOMAIN              = '3taps.com'
  SEARCH_END_POINT    = "http://search.#{DOMAIN}"
  POLLING_END_POINT   = "http://polling.#{DOMAIN}"
  REFERENCE_END_POINT = "http://reference.#{DOMAIN}"

  ANCHOR_URL          = "#{POLLING_END_POINT}/anchor"
  POLL_URL            = "#{POLLING_END_POINT}/poll"

  DATA_SOURCES_URL    = "#{REFERENCE_END_POINT}/sources"
  CATEGORY_GROUPS_URL = "#{REFERENCE_END_POINT}/category_groups"
  CATEGORIES_URL      = "#{REFERENCE_END_POINT}/categories"
  LOCATIONS_URL       = "#{REFERENCE_END_POINT}/locations"
  LOCATION_LOOKUP_URL = "#{REFERENCE_END_POINT}/locations/lookup"

  attr_accessor :api_key

  def search(criteria={})
    request SEARCH_END_POINT, criteria
  end

  def anchor(timestamp=Time.now.to_i)
    request ANCHOR_URL, :timestamp => timestamp
  end

  def poll(*args)
    criteria = args.extract_options!
    anchor   = args.first || criteria[:anchor]
    anchor   = self.anchor['anchor'] if anchor.nil?
    request POLL_URL, criteria.merge(:anchor => anchor)
  end

  def data_sources
    request DATA_SOURCES_URL
  end

  def category_groups
    request CATEGORY_GROUPS_URL
  end

  def categories
    request CATEGORIES_URL
  end

  def locations(level='country')
    request LOCATIONS_URL, :level => level
  end

  def lookup_location(code)
    request LOCATION_LOOKUP_URL, :code => code
  end

  def default_params
    { :auth_token => api_key }
  end

  def request(url, params={})
    params   = default_params.merge params.flatten
    response = RestClient.get url, :params => params, :accept => :json
    response.decode_json
  end

  def log=(io)
    RestClient.log = io
  end
end
