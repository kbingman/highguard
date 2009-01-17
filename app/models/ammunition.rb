class Ammunition
  include DataMapper::Resource
  
  property :id, Serial
  property :type, String
  property :per_ton, Integer
  
end
