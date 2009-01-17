class Uploads < Application

  def index
    @uploads = Upload.all
    @uploads.each do |upload|
      upload.thumbnail('thumb','120x80')
    end
    display @uploads
  end
  
  def new
    render
  end
  
  def show(id)
    @upload = Upload.get(id)
    raise NotFound unless @upload
    @upload.thumbnail('display','640x640')
    display @upload
  end
  
  def create
    @upload = Upload.new
    @upload.file_size = params[:file][:size]
    @upload.content_type = params[:file][:content_type]
    
    tempfile_path = params[:file][:tempfile].path
    filename = File.basename(params[:file][:filename]) 
    
    if @upload.process(tempfile_path,filename)
      redirect url(:upload, @upload)
    else
      message[:error] = "Error uploading"
      render :new
    end
  end
  
  def import
    dir = File.join Merb.root, 'public', 'import'
    @files = Dir[File.join(dir, '*')].find_all{|file| file if File.file?(file)}
    @files.each do |file|
      upload = Upload.new
      filename = File.basename(file)
      upload.filename = filename
      upload.size = File.size(filename)
      upload.process(file,filename)
    end
    render
  end
end
