namespace :merbguard do
  
  desc "Setup the additional info in the database"
  task :setup do 
    Computer.create(:name => "test", :tonnage => "test") 
  end
  
end