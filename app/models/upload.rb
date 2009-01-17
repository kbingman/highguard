class Upload
  include DataMapper::Resource
  
  # before :save, :sanitize_filename
  before :destroy, :delete_files
  
  property :id, Serial
  property :filename, String
  property :file_size, Integer
  property :content_type, String
  
  validates_present :filename
  
  def folder
    self.class.to_s.downcase.pluralize
  end
  
  def url(name = nil)
    File.join '/', folder, id.to_s, thumbnail_name(name)
  end
  
  def path(name = nil)
    File.join Merb.root, 'public', folder, id.to_s, thumbnail_name(name)
  end
  
  def process(temp,target)
    extname = File.extname(target) 
    basename = File.basename(target, '.*') 
    self.filename = "#{basename}#{extname}"   
    self.file_size = File.size(temp)
    self.save
        
    # Copy the file to the destination 
    FileUtils.mkdir_p(File.dirname(self.path)) 
    FileUtils.mv(temp, self.path)
    create_thumbnail('thumb','120x80')
    create_thumbnail('icon','42x42',{:crop => true})
  end
  
  def thumbnail(name,size,options={})
    create_thumbnail(name,size,options={}) unless File.exists?(self.path(name))
  end
      
  private
  
    def create_thumbnail(name,size,options={})
      if options[:crop] == true
        system("convert #{self.path} -resize '#{size}^' -gravity center -crop '#{size}+0+0' +repage #{self.path(name)}")
      else
        system("convert #{self.path} -resize '#{size}>' #{self.path(name)}")
      end
    end
    
    def thumbnail_name(name = nil)
      name.nil? ? filename : "#{File.basename(filename, '.*')}_#{name}#{File.extname(filename)}"
    end
    
    def delete_files
      dir = File.dirname(self.path)
      FileUtils.rm_rf(dir) if File.exists?(dir) && File.directory?(dir) 
    end
        
end
