class Ships < Application
  # provides :js, :pdf  

  def index
    @ships = Ship.all
    @title = 'Ships'
    display @ships
  end

  def show(id)
    provides :html, :pdf, :text
    @ship = Ship.get(id)
    @title = @ship.name
    raise NotFound unless @ship
 
    case content_type 
    when :pdf
      pdf = generate_pdf
      send_file pdf, :file_name => "#{@ship.name}.pdf", :type => 'application/pdf', :disposition => 'inline'
    else 
      display @ship
    end
    
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
    @title = @ship.name
    @configurations = Configuration.all
    @weapons = Weapon.all
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
    
    # Saves the params of each type of weapons
    update_ship_weapons('bay')
    update_ship_weapons('barbette')
    update_ship_weapons('turret')

    raise NotFound unless @ship
    if @ship.update_attributes(ship)
      case content_type 
      when :js
        display @ship
      else 
        redirect resource(@ship, :edit)
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
  
  protected
    def update_ship_weapons(weapon_type)
      weapon = weapon_type.to_sym
      if params[weapon] && params[weapon][:number] != ''
        klass = Object.full_const_get(weapon_type.capitalize)
        @weapon_type = klass.new(params[weapon])
        @ship.send(weapon_type.pluralize) << @weapon_type
        @weapon_type.save
      end   
    end
    
    def generate_pdf
      pdf = Prawn::Document.new do |p| 
        p.text 'Document Name', :align => 'center' 
        p.text 'Address: address' 
        p.text 'text end' 
      end.render_file "/Users/keith/Merb/highguard/public/#{@ship}.pdf"
      send_file pdf, :filename => "#{@ship.name}.pdf", :type => 'application/pdf'
    end

end # Ships
