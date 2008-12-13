require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a weapons exists" do
  Weapon.all.destroy!
  request(resource(:weapons), :method => "POST", 
    :params => { :weapon => { :id => nil }})
end

describe "resource(:weapons)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:weapons))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of weapons" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a weapons exists" do
    before(:each) do
      @response = request(resource(:weapons))
    end
    
    it "has a list of weapons" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Weapon.all.destroy!
      @response = request(resource(:weapons), :method => "POST", 
        :params => { :weapon => { :id => nil }})
    end
    
    it "redirects to resource(:weapons)" do
      @response.should redirect_to(resource(Weapon.first), :message => {:notice => "weapon was successfully created"})
    end
    
  end
end

describe "resource(@weapon)" do 
  describe "a successful DELETE", :given => "a weapon exists" do
     before(:each) do
       @response = request(resource(Weapon.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:weapons))
     end

   end
end

describe "resource(:weapons, :new)" do
  before(:each) do
    @response = request(resource(:weapons, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@weapon, :edit)", :given => "a weapon exists" do
  before(:each) do
    @response = request(resource(Weapon.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@weapon)", :given => "a weapon exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Weapon.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @weapon = Weapon.first
      @response = request(resource(@weapon), :method => "PUT", 
        :params => { :weapon => {:id => @weapon.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@weapon))
    end
  end
  
end

