module MuthofunApi
  module Errors
    PhoneNumberNotProvided = Class.new(ArgumentError)
    SMSContentNotProvided  = Class.new(ArgumentError)
    AuthenticationError    = Class.new(StandardError)
    CredentialMissing        = Class.new(StandardError)
  end
end

