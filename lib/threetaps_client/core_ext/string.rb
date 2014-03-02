class String
  # Parses a JSON string (JavaScript Object Notation) into a hash.
  #
  #   "{\"success\":true,\"anchor\":640503449}".decode_json
  #   # => { "success": true, "anchor":640503449 }
  def decode_json
    JSON(self)
  end
end
