require 'open-uri'

module Yandex
  class Client
    # class << self
      # attr_accessor :configuration

      def self.translate(word, from = :en, to = :pl)
        uri = URI::HTTPS.build(
          host: @@configuration.host, 
          path: @@configuration.path,
          query: 
            {key: @@configuration.api_key, 
            lang: 'en-pl', 
            text: word}.to_query)
        result = open(uri).read
        JSON(result).try(:[], 'text').try(:join, ' ')
      end

      def self.configure
        @@configuration ||= Yandex::Configuration.new
        yield(@@configuration) if block_given?
      end
    # end
  end
end