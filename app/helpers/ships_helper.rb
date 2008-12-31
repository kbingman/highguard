module Merb
  module ShipsHelper
    
    def tech_levels
      tech_level = []
      8.times do |i|
        tech_level << "#{i + 8}"
      end
      tech_level
    end
     
    def commify(n)
      n.to_s =~ /([^\.]*)(\..*)?/
      int, dec = $1.reverse, $2 ? $2 : ""
      while int.gsub!(/(,|\.|^)(\d{3})(\d)/, '\1\2,\3')
      end
      int.reverse # + dec - removed the decimal point because we don't need it here
    end
    
    def number_select(n)
      result = ''
      n.times do |i|
        result += "<option>#{i}</option>\n"
      end
      result
    end
    
    def tech_level_select
      result = ''
      8.times do |i|
        if @ship.new_record?
          result = result + "<option>#{i + 8}</option>\n"
        else
          selected = (i + 8) == @ship.tech_level ? ' selected="selected"':''
          result += "<option#{selected}>#{i + 8}</option>\n"
        end
      end
      result
    end
    
    def drive_select(attribute)
      result = ''
      6.times do |i|
        unless i + 1 > @ship.send("max_#{attribute}")
          selected = (@ship.send(attribute) == i + 1) ? ' selected="selected"':''
          result += "<option#{selected}>#{i + 1}</option>\n"
        end
      end
      result
    end

    def power_select(n)
      result = ''
      n.times do |i|
        thrust = @ship.thrust ? @ship.thrust : 0
        jump = @ship.jumpdrive ? @ship.jumpdrive : 0
        unless i + 1 < thrust or i + 1 < jump
          selected = (@ship.power == i + 1) ? ' selected="selected"':''
          result += "<option#{selected}>#{i + 1}</option>\n"
        end
      end
      result
    end
    
    def armor_select(tech_level)
      result = "<option value=''> </option>"
      Armor.all.each do |armor|
        selected = @ship.armor == armor ? ' selected="selected"':''
        result += "<option value='#{armor.id}'#{selected}>#{armor.name}</option>" unless armor.tech_level > tech_level
      end
      result
    end
    
    def armor_rating_select(tech_level)
      result = ''
      if @ship.armor_id
        max = @ship.tech_level <= @ship.armor.max ? @ship.tech_level : @ship.armor.max
        rating = @ship.armor.name
        max.times do |r|
          armor_value = r + 1
          selected = @ship.armor_rating == armor_value ? ' selected="selected"':''
          result += "<option#{selected}>#{armor_value}</option>"
        end
      end
      result
    end
        
    def weapon_select(name)
      result = ''
      Weapon.all.each do |weapon|
        result += "<option value='#{weapon.id}'>#{weapon.name}</option>\n" unless weapon.send(name) == false
      end
      result
    end
    
    def weapon_size_select(name)
      case name
        when 'bay'      : fields = [['50','50 Tons'],['100','100 Tons']]
        when 'turret'   : fields = [['3','Triple'],['2','Double'],['1','Single']]
        when 'barbette' : fields = [['5','5 Tons']]
      end
      result = ''
      fields.each do |field|
        result += "<option value='#{field[0]}'>#{field[1]}</option>\n" 
      end
      result
    end
    
  end
end # Merb