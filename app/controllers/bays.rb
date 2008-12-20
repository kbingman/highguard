class Bays < Application
  # provides :xml, :yaml, :js

  def index
    @bays = Bay.all
    display @bays
  end

  def show(id)
    @bay = Bay.get(id)
    raise NotFound unless @bay
    display @bay
  end

  def new
    only_provides :html
    @bay = Bay.new
    display @bay
  end

  def edit(id)
    only_provides :html
    @bay = Bay.get(id)
    raise NotFound unless @bay
    display @bay
  end

  def create(bay)
    @bay = Bay.new(bay)
    if @bay.save
      redirect resource(@bay), :message => {:notice => "Bay was successfully created"}
    else
      message[:error] = "Bay failed to be created"
      render :new
    end
  end

  def update(id, bay)
    @bay = Bay.get(id)
    raise NotFound unless @bay
    if @bay.update_attributes(bay)
       redirect resource(@bay)
    else
      display @bay, :edit
    end
  end

  def destroy(id)
    @bay = Bay.get(id)
    raise NotFound unless @bay
    if @bay.destroy
      redirect resource(:bays)
    else
      raise InternalServerError
    end
  end

end # Bays
