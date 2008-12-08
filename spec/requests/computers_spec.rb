require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a computer exists" do
  Computer.all.destroy!
  request(resource(:computers), :method => "POST", 
    :params => { :computer => { :id => nil }})
end

describe "resource(:computers)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:computers))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of computers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a computer exists" do
    before(:each) do
      @response = request(resource(:computers))
    end
    
    it "has a list of computers" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Computer.all.destroy!
      @response = request(resource(:computers), :method => "POST", 
        :params => { :computer => { :id => nil }})
    end
    
    it "redirects to resource(:computers)" do
      @response.should redirect_to(resource(Computer.first), :message => {:notice => "computer was successfully created"})
    end
    
  end
end

describe "resource(@computer)" do 
  describe "a successful DELETE", :given => "a computer exists" do
     before(:each) do
       @response = request(resource(Computer.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:computers))
     end

   end
end

describe "resource(:computers, :new)" do
  before(:each) do
    @response = request(resource(:computers, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@computer, :edit)", :given => "a computer exists" do
  before(:each) do
    @response = request(resource(Computer.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@computer)", :given => "a computer exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Computer.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @computer = Computer.first
      @response = request(resource(@computer), :method => "PUT", 
        :params => { :computer => {:id => @computer.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@computer))
    end
  end
  
end

