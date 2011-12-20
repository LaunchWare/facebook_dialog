require 'spec_helper'

describe FacebookDialog::OptionSerialization do
  subject do
    FacebookDialog::OptionSerialization.new({
      response_type: [:code, :token],
      scope: [:offline_access, :email]
    })
  end
  it "breaks an array of response types into a comma delimited list" do
    subject.serialized_hash[:response_type].should eql("code,token")
  end

  it "breaks an array of scopes into a comma delimited list" do
    subject.serialized_hash[:scope].should eql("offline_access,email")
  end
end
