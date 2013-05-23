require 'spec_helper'

describe FileUploader do
  include CarrierWave::Test::Matchers

  before(:each) do
    @document = Factory.build(:document)
  end

  describe "Uploader" do
    it "must have cache directory" do
      @document.file.cache_dir.should_not be_empty
    end

    it "must have storage directory" do
      @document.file.store_dir.should_not be_empty
    end

    it "should have a readable name" do
      @document.name.should eql(@document.file.to_readable_name)
    end

    it "should have xml in the white list" do
      assert @document.file.extension_white_list.include?("xml")
    end
  end
end
