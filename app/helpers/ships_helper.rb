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
    
    def numbers_list(n)
      list = []
      n.times do |i|
        list << ["#{i+1}", "#{i+1}"]
      end
      list
    end
    
    def tech_level_select
      result = ""
      8.times do |i|
        if @ship.new_record?
          result = result + "<option>#{i + 8}</option>\n"
        else
          selected = (i + 8) == @ship.tech_level ? ' selected="selected"':''
          result = result + "<option#{selected}>#{i + 8}</option>\n"
        end
      end
      result
    end
    
    def drive_select(attribute)
      result = ''
      6.times do |i|
        unless i + 1 > @ship.send("max_#{attribute}")
          selected = (@ship.send(attribute) == i + 1) ? ' selected="selected"':''
          result = result + "<option#{selected}>#{i + 1}</option>\n"
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
          result = result + "<option#{selected}>#{i + 1}</option>\n"
        end
      end
      result
    end
    
    def weapon_select(name, weapons)
      result = ''
      weapons.each do |weapon|
        result = result + "<option>#{weapon.name}</option>\n" unless weapon.send(name) == false
      end
      result
    end
    
  end
end # Merb