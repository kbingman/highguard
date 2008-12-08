class Configurations < Application
  # provides :xml, :yaml, :js

  def index
    @configurations = Configuration.all
    display @configurations
  end

  def show(id)
    @configuration = Configuration.get(id)
    raise NotFound unless @configuration
    display @configuration
  end

  def new
    only_provides :html
    @configuration = Configuration.new
    display @configuration
  end

  def edit(id)
    only_provides :html
    @configuration = Configuration.get(id)
    raise NotFound unless @configuration
    display @configuration
  end

  def create(configuration)
    @configuration = Configuration.new(configuration)
    if @configuration.save
      redirect resource(@configuration), :message => {:notice => "Configuration was successfully created"}
    else
      message[:error] = "Configuration failed to be created"
      render :new
    end
  end

  def update(id, configuration)
    @configuration = Configuration.get(id)
    raise NotFound unless @configuration
    if @configuration.update_attributes(configuration)
       redirect resource(@configuration)
    else
      display @configuration, :edit
    end
  end

  def destroy(id)
    @configuration = Configuration.get(id)
    raise NotFound unless @configuration
    if @configuration.destroy
      redirect resource(:configurations)
    else
      raise InternalServerError
    end
  end

end # Configurations
