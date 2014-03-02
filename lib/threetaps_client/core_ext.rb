Dir[File.join(File.dirname(__FILE__), 'core_ext', '*.rb')].sort.each do |file|
  require "threetaps_client/core_ext/#{File.basename(file, '*.rb')}"
end
