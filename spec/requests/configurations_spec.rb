require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a configuration exists" do
  Configuration.all.destroy!
  request(resource(:configurations), :method => "POST", 
    :params => { :configuration => { :id => nil }})
end

describe "resource(:configurations)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:configurations))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of configurations" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a configuration exists" do
    before(:each) do
      @response = request(resource(:configurations))
    end
    
    it "has a list of configurations" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Configuration.all.destroy!
      @response = request(resource(:configurations), :method => "POST", 
        :params => { :configuration => { :id => nil }})
    end
    
    it "redirects to resource(:configurations)" do
      @response.should redirect_to(resource(Configuration.first), :message => {:notice => "configuration was successfully created"})
    end
    
  end
end

describe "resource(@configuration)" do 
  describe "a successful DELETE", :given => "a configuration exists" do
     before(:each) do
       @response = request(resource(Configuration.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:configurations))
     end

   end
end

describe "resource(:configurations, :new)" do
  before(:each) do
    @response = request(resource(:configurations, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@configuration, :edit)", :given => "a configuration exists" do
  before(:each) do
    @response = request(resource(Configuration.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@configuration)", :given => "a configuration exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Configuration.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @configuration = Configuration.first
      @response = request(resource(@configuration), :method => "PUT", 
        :params => { :configuration => {:id => @configuration.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@configuration))
    end
  end
  
end

