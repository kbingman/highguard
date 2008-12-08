class Configuration
  include DataMapper::Resource
  
  property :id,             Serial
  property :name,           String
  property :streamlined,    String
  property :modifier,       Float
  
  property :created_at,     DateTime
  property :updated_at,     DateTime
  
  has n, :ships
end
