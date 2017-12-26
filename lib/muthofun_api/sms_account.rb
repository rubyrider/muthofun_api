module MuthofunApi
  class SmsAccount
    def self.send_sms(phone_number, body)
      @sms_sender = self.new.send_sms(phone_number, body)
    end
    
    def send_sms(phone_number, body)
      request(path: 'sendsms.jsp', method: 'get', params: {'sms' => body, 'mobiles' => phone_number})
      
      @result = MuthofunApi::Result.new(response)
      
      yield(@result) if block_given? && @result.success?
      
      pp @result
      
      @result
      
    rescue => e
      p e.message
    end
    
    def response
      @response
    end
    
    private
    
    def request(path:, method: 'get', params: )
      MuthofunApi.check_credentials!
      
      conn = ::Faraday.new(:url => "http://clients.muthofun.com:8901/esmsgw/#{path}")
      
      response = conn.send(method.to_sym) do |req|
        req.params['user']     = MuthofunApi.configuration.client_id
        req.params['password'] = MuthofunApi.configuration.secret_key
        req.params['unicode']  = 1
        req.params.merge!(params)
        pp req.params
      end
      
      @response = response.body.gsub(/[\r\n\t]+/m, "").strip
    end
  end
end
