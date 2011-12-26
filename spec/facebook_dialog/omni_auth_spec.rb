require 'spec_helper'

describe FacebookDialog::OmniAuth do
  before do
    FacebookDialog.api_key = "blah"
  end

  subject { FacebookDialog::OmniAuth.dialog }

  its(:url) { should include "client_id=#{Rack::Utils.escape(FacebookDialog.api_key)}" }
  its(:url) { should match(/redirect_uri=[^\&]/) }
end

