require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a import exists" do
  Import.all.destroy!
  request(resource(:imports), :method => "POST", 
    :params => { :import => { :id => nil }})
end

describe "resource(:imports)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:imports))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of imports" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a import exists" do
    before(:each) do
      @response = request(resource(:imports))
    end
    
    it "has a list of imports" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Import.all.destroy!
      @response = request(resource(:imports), :method => "POST", 
        :params => { :import => { :id => nil }})
    end
    
    it "redirects to resource(:imports)" do
      @response.should redirect_to(resource(Import.first), :message => {:notice => "import was successfully created"})
    end
    
  end
end

describe "resource(@import)" do 
  describe "a successful DELETE", :given => "a import exists" do
     before(:each) do
       @response = request(resource(Import.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:imports))
     end

   end
end

describe "resource(:imports, :new)" do
  before(:each) do
    @response = request(resource(:imports, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@import, :edit)", :given => "a import exists" do
  before(:each) do
    @response = request(resource(Import.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@import)", :given => "a import exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Import.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @import = Import.first
      @response = request(resource(@import), :method => "PUT", 
        :params => { :import => {:id => @import.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@import))
    end
  end
  
end

