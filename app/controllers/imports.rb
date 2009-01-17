class Imports < Application
  # provides :xml, :yaml, :js

  def index
    @imports = Import.all
    display @imports
  end

  def show(id)
    @import = Import.get(id) 
    @size = @import.size   
     
    raise NotFound unless @import
    display @import
  end

  def new
    only_provides :html
    @import = Import.new 
    @path = File.join Merb.root, 'public', 'import'     
    display @import
  end

  def edit(id)
    only_provides :html
    @import = Import.get(id) 
    @size = @import.size   
    raise NotFound unless @import
    display @import
  end

  def create(import)
    @import = Import.new(import)    
    
    dir = File.join Merb.root, 'public', 'import'
    files = Dir[File.join(dir, '*')].find_all{|file| file if File.file?(file)}    
    
    @import.path = dir  
    # @import.size = files.size          
    @import.total_size = files.size
    
    if @import.save     
      redirect url(:import, @import) # , :message => {:notice => "#{@import.size} files were successfully imported."} 
    else
      message[:error] = "Import failed to be created"
      render :new
    end
  end

  def update(id, import)    
    provides :html, :js
    @import = Import.get(id)   
    @title = 'Upload Progress'
    raise NotFound unless @import  
      
    files = Dir[File.join(@import.path, '*')].find_all{|file| file if File.file?(file)}   
    @size = @import.size     
    
    if @size > 0
      file = files.first  
      upload = Upload.new
      filename = File.basename(file)
      if upload.process(file,filename)     
        @size -= 1      
        # @import.size = @size
      else  
        display @import, :show
      end 
      if @import.save
         case content_type 
         when :js        
           @import.destroy if @size == 0 
           display @import
         else  
           redirect resource(@import)       
         end
      else
        display @import, :show
      end 
    else     
      @import.destroy
      message[:message] = "Files successfully imported."
      redirect url(:uploads)
    end
    
  end

  def destroy(id)
    @import = Import.get(id)
    raise NotFound unless @import
    if @import.destroy
      redirect resource(:imports)
    else
      raise InternalServerError
    end
  end

end 
