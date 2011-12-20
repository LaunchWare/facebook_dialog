require 'spec_helper'

describe FacebookDialog::Oauth do
  let(:redirect_uri) { "http://www.example.com" }
  let(:scope) { ["email", "offline_access"] }
  let(:state) { "something_passed_through" }
  let(:response_type) { "code" }
  let(:display) { "popup" }

  let(:options) do
    {
      redirect_uri: redirect_uri,
      scope: scope,
      state: state,
      response_type: response_type,
      display: display
    }
  end

  subject { FacebookDialog::Oauth.new(options) }

  its(:url) { should include("redirect_uri=#{Rack::Utils.escape(redirect_uri)}")}
end

