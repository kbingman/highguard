require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a ship exists" do
  Ship.all.destroy!
  request(resource(:ships), :method => "POST", 
    :params => { :ship => { :id => nil }})
end

describe "resource(:ships)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:ships))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of ships" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a ship exists" do
    before(:each) do
      @response = request(resource(:ships))
    end
    
    it "has a list of ships" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Ship.all.destroy!
      @response = request(resource(:ships), :method => "POST", 
        :params => { :ship => { :id => nil }})
    end
    
    it "redirects to resource(:ships)" do
      @response.should redirect_to(resource(Ship.first), :message => {:notice => "ship was successfully created"})
    end
    
  end
end

describe "resource(@ship)" do 
  describe "a successful DELETE", :given => "a ship exists" do
     before(:each) do
       @response = request(resource(Ship.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:ships))
     end

   end
end

describe "resource(:ships, :new)" do
  before(:each) do
    @response = request(resource(:ships, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@ship, :edit)", :given => "a ship exists" do
  before(:each) do
    @response = request(resource(Ship.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@ship)", :given => "a ship exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Ship.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @ship = Ship.first
      @response = request(resource(@ship), :method => "PUT", 
        :params => { :ship => {:id => @ship.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@ship))
    end
  end
  
end

