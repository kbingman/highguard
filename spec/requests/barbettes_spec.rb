require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a barbette exists" do
  Barbette.all.destroy!
  request(resource(:barbettes), :method => "POST", 
    :params => { :barbette => { :id => nil }})
end

describe "resource(:barbettes)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:barbettes))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of barbettes" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a barbette exists" do
    before(:each) do
      @response = request(resource(:barbettes))
    end
    
    it "has a list of barbettes" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Barbette.all.destroy!
      @response = request(resource(:barbettes), :method => "POST", 
        :params => { :barbette => { :id => nil }})
    end
    
    it "redirects to resource(:barbettes)" do
      @response.should redirect_to(resource(Barbette.first), :message => {:notice => "barbette was successfully created"})
    end
    
  end
end

describe "resource(@barbette)" do 
  describe "a successful DELETE", :given => "a barbette exists" do
     before(:each) do
       @response = request(resource(Barbette.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:barbettes))
     end

   end
end

describe "resource(:barbettes, :new)" do
  before(:each) do
    @response = request(resource(:barbettes, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@barbette, :edit)", :given => "a barbette exists" do
  before(:each) do
    @response = request(resource(Barbette.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@barbette)", :given => "a barbette exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Barbette.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @barbette = Barbette.first
      @response = request(resource(@barbette), :method => "PUT", 
        :params => { :barbette => {:id => @barbette.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@barbette))
    end
  end
  
end

