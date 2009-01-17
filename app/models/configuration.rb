class Configuration
  include DataMapper::Resource
  
  property :id,             Serial
  property :name,           String
  property :streamlined,    String
  property :modifier,       Float
  
  has n, :ships
end
