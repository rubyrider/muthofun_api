module MuthofunApi
  class Result
    def initialize(response)
      @response = Hash.from_xml(response || '') || {smslist: {sms: {}, error: {}}}
    end
    
    def output
      @response.deep_symbolize_keys!
    end
    
    def success?
      !failed?
    end
    
    def failed?
      output[:smslist].present? && output[:smslist][:error].present?
    end
    
    def sms_client_id
      output[:smslist][:sms][:mobile_no] if success?
    end
    
    def message_id
      output[:smslist][:sms][:messageid] if success?
    end
    
    def mobile
      output[:smslist][:sms][:mobile_no] if success?
    end
    
    def error_description
      output[:smslist][:error][:error_description] if failed?
    end
    
    def error_code
      output[:smslist][:error][:error_code] if failed?
    end
    
    def error
      {
          description: output[:smslist][:error][:error_description],
          error_code:  output[:smslist][:error][:error_code]
      }
    end
  end
end
