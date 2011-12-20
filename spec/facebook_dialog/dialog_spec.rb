require 'spec_helper'

describe FacebookDialog::Dialog do
  class DummyDialog < FacebookDialog::Dialog; end

  it "includes the api key as an app id argument" do
    FacebookDialog.api_key = "something"
    FacebookDialog::Feed.new.url.should include("app_id=#{Rack::Utils.escape(FacebookDialog.api_key)}")
  end
  
  it "raises an error when a resource name is not defined when getting base uri" do
    lambda { DummyDialog.base_uri }.should raise_error(
      FacebookDialog::ResourceNameNotDefined
    )
  end

  it "validates the display" do
    mock_validator = mock(:validate => nil)
    FacebookDialog::Validators::Display.expects(:new).returns(mock_validator)

    DummyDialog.new.to_h
  end
end
