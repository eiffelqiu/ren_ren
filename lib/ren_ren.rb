require 'ren_ren/config'
require 'ren_ren/base'
require 'yaml'

if File.exists?('config/config.yml')
  config = YAML.load_file('config/config.yml')
  RenRen::Config.api_key = config["api_key"]
  RenRen::Config.api_secret = config["api_secret"]
  RenRen::Config.access_token = config["access_token"]
end