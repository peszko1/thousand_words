# ??? why this needs to be here?
# if it's not here the config is disappearing
# Yandex::Client.configuration

Yandex::Client.configure do |c|
  c.api_key = YAML.load_file("#{Rails.root.to_s}/config/yandex.yml")[Rails.env]['api_key']
end