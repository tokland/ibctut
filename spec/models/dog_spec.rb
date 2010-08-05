require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Dog do
  describe "call by name" do
    before { @dog = Factory(:dog, :name => 'lassie') }
        
    it "should bark if it's its name" do
      @dog.call_by_name("lassie").should == "guau"
    end
    
    it "should ignore other dogs names" do
      @dog.call_by_name("pluto").should be_nil
    end
  end
end
