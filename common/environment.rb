require 'yaml'
class Environment

  def self.load(environment_name)
    Environment.new(environment_name)
  end

  def initialize(environment_name)
    @config = OpenStruct.new(YAML.load_file("environments/#{environment_name}.yml"))
  end

  def userpi_base_url
    "#{@config.app_base_url}/userpi"
  end

end
