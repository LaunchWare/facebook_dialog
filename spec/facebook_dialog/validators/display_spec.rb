require 'spec_helper'

describe FacebookDialog::Validators::Display do
  subject { FacebookDialog::Validators::Display }
  it "does not raise an error when I specify a valid display" do
    lambda { subject.new({display: "popup"}).validate }.should_not raise_error
  end

  it "raises an error when an invalid display is specified" do
    lambda { subject.new({display: "bogus"}).validate }.should raise_error FacebookDialog::InvalidDisplay
  end
  
  it "raises an error when wap is specified without an access key" do
    lambda { subject.new({display: "wap"}).validate }.should raise_error FacebookDialog::InvalidDisplay
  end

  it "does not raise an error when wap is specified along with an access key" do
    lambda { subject.new({display: "wap", access_key: "blah"}).validate }.should_not raise_error
  end
end

