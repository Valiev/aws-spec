require "aws-sdk"
require "yaml"
require "rspec/collection_matchers"

if File.exist?("config/aws.yml")
  config = YAML.load_file("config/aws.yml")
  Aws.config[:region] = config["region"]
  Aws.config[:credentials] = Aws::Credentials.new(config["access_key_id"], config["secret_access_key"])
end
