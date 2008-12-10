class Ships < Application
  provides :xml, :yaml, :js, :json

  def index
    @ships = Ship.all
    @title = 'Ships'
    display @ships
  end

  def show(id)
    @ship = Ship.get(id)
    @title = @ship.name
    raise NotFound unless @ship
    display @ship
  end

  def new
    only_provides :html
    @ship = Ship.new
    @configurations = Configuration.all
    display @ship
  end

  def edit(id)
    only_provides :html
    @ship = Ship.get(id)
    @configurations = Configuration.all
    raise NotFound unless @ship
    display @ship
  end

  def create(ship)
    @ship = Ship.new(ship)
    if @ship.save
      redirect url(:edit_ship, @ship), :message => {:notice => "Ship was successfully created"}
    else
      message[:error] = "Ship failed to be created"
      render :new
    end
  end

  def update(id, ship)
    provides :html, :js
    @ship = Ship.get(id)
    @configurations = Configuration.all
    raise NotFound unless @ship
    if @ship.update_attributes(ship)
      
      case content_type 
      when :js
        display @ship
      else 
        redirect resource(@ship, :edit), :message => {:notice => "Ship was successfully updated"}
      end
    else
      display @ship, :edit, :message => {:notice => "There was a problem updating the ship."}
    end
  end

  def destroy(id)
    @ship = Ship.get(id)
    raise NotFound unless @ship
    if @ship.destroy
      redirect resource(:ships)
    else
      raise InternalServerError
    end
  end

end # Ships
