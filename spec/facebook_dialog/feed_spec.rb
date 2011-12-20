require 'spec_helper'

describe FacebookDialog::Feed do
  let(:redirect_uri) { "http://www.example.com" }
  let(:name) { "Title! With. Special Characters" }
  let(:caption) { "A Caption" }
  let(:description) { "A description" }
  let(:api_key) { "An Api Key" }

  before(:each) do
    FacebookDialog.api_key = api_key
  end

  subject do 
    FacebookDialog::Feed.new({
      redirect_uri: redirect_uri, 
      name: name, 
      link: redirect_uri,
      caption: caption, 
      description: description
    })
  end

  its(:url) { should include(Rack::Utils.escape(redirect_uri)) }
  its(:url) { should include(Rack::Utils.escape(name)) }
  its(:url) { should include(Rack::Utils.escape(description)) }
  its(:url) { should include(Rack::Utils.escape(caption)) }

  its(:url) { should include("facebook.com") }

  it "omits the redirect uri from the serialized hash" do
    subject.serializable_hash.keys.should_not include(:redirect_uri)
  end

  it "omits the display from the serialized hash" do
    subject.serializable_hash.keys.should_not include(:display)
  end
end

