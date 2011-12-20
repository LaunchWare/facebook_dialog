require 'spec_helper'

describe FacebookDialog::Dialog do
  class DummyDialog < FacebookDialog::Dialog; end

  it "raises an error when a resource name is not defined when getting base uri" do
    lambda { DummyDialog.base_uri }.should raise_error(
      FacebookDialog::ResourceNameNotDefined
    )
  end
end
