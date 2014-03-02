class Hash
  # Returns a "flatten" hash representation of the receiver:
  #
  #   { :source => 'CRAIG', :location => { :country => 'USA' } }.flatten
  #   # => { :source => 'CRAIG', :"location.country" => 'USA' }
  #
  #   { :param => 1, :nested => { :param => 2, :nested => { :param => 2 } } }.flatten
  #   # => { :param => 1, :"nested.param" => 2, :"nested.nested.param" => 2}
  #
  # An optional prefix can be passed to enclose the key names:
  #
  #   { :country => 'USA', :state => 'CA' }.flatten('location')
  #   # => { :"location.country" => 'USA', :"location.state" => 'CA' }
  def flatten(prefix=nil)
    prefix = "#{prefix}." if prefix
    inject({}) do |hash, (key, value)|
      if value.is_a?(Hash)
        hash.merge! value.flatten("#{prefix}#{key}")
      else
        hash[:"#{prefix}#{key}"] = value
      end
      hash
    end
  end
end
