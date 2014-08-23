require 'wordnik'

Wordnik.configure do |config|
  config.api_key = YAML.load_file("#{Rails.root.to_s}/config/wordnik.yml")[Rails.env]['api_key']
  config.logger = Logger.new('/dev/null')
end