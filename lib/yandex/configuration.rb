module Yandex
  class Configuration
    attr_accessor :api_key
    attr_accessor :host
    attr_accessor :path

    def initialize
      self.host = "translate.yandex.net"
      self.path = "/api/v1.5/tr.json/translate"
    end
  end
end