module MuthofunApi
  class Configuration
    attr_accessor :client_id, :secret_key, :originator
    
    def initialize
      @client_id  = nil
      @secret_key = nil
      @originator = nil
    end
  end
end
