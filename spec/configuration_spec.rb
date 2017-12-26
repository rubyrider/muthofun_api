require File.expand_path('lib/muthofun_api')

RSpec.describe MuthofunApi::Configuration do
  describe "#score" do
    it 'should cache sms gateway credentials' do
      @configuration            = MuthofunApi::Configuration.new
      @configuration.client_id  = 'your username'
      @configuration.secret_key = 'your password'
      @configuration.originator = 'your originator'
      @configuration.mobiles    = '8801766678130'

      expect(@configuration.client_id).to eq('your username')
      expect(@configuration.client_id).not_to be_nil
    end
  end
end