require "muthofun_api/version"
require 'muthofun_api/configuration'

module MuthofunApi
  class << self
    attr_accessor :configuration
  end
  
  def self.configuration
    @configuration ||= Configuration.new
  end
  
  def self.reset
    @configuration = Configuration.new
  end
  
  def self.configure
    yield(configuration)
  end
end
