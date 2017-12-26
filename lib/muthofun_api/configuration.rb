module MuthofunApi
  class Configuration
    attr_accessor :client_id, :secret_key, :mobiles, :originator

    def initialize
      @client_id = nil
      @secret_key = nil
      @mobiles = nil
      @originator = nil
    end
  end
end
