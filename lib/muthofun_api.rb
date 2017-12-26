require 'pp'
require 'faraday'
require 'open-uri'
require 'active_support/core_ext/hash/conversions'

require "muthofun_api/version"
require 'muthofun_api/configuration'
require 'muthofun_api/errors/errors'
require 'muthofun_api/sms_account'
require 'muthofun_api/result'

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

    check_credentials!
  end
  
  def self.check_credentials!
    unless self.configuration.client_id && self.configuration.secret_key
      raise Errors::CredentialMissing, 'Please provide api credential'
    end
    
    true
  end
end
