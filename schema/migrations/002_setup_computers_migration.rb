migration 2, :setup_computers  do
  up do
    Computer.create :model=> 1,	:price => 2,	:tonnage => 1,	:capacity => '2/4',	:ship => 6,	:tech_level => 5,	:ep => 0
    Computer.create :model=> '1fib', :price => 3,	:tonnage => 2,	:capacity => '2/4',	:ship => 6,	:tech_level => 5,	:ep => 0
    Computer.create :model=> '1bis',	:price => 4,	:tonnage => 1,	:capacity => '4/0',	:ship => 6,	:tech_level => 6,	:ep => 0
    Computer.create :model=> 2,	:price => 9,	:tonnage => 2,	:capacity => '3/6',	:ship => A,	:tech_level => 7,	:ep => 0
    Computer.create :model=> '2fib', :price => 4,	:tonnage => 4,	:capacity => '3/6',	:ship => A,	:tech_level => 7,	:ep => 0
    Computer.create :model=> '2bis', :price => 8,	:tonnage => 2,	:capacity => '6/0',	:ship => A,	:tech_level => 8,	:ep => 0
    Computer.create :model=> 3, :price => 8, :tonnage => 3,	:capacity => '5/9',	:ship => D,	:tech_level => 9,	:ep => 1
    Computer.create :model=> '3fib', 2:price => 7,	:tonnage => 6,	:capacity => '5/9',	:ship => D,	:tech_level => 9,	:ep => 1
    Computer.create :model=> 4,	:price => 4.0, :tonnage => 4, :capacity => '8/15',	:ship => K,	:tech_level => 'A',	:ep => 2
    Computer.create :model=> '4fib', :price => 2, :tonnage => 8, :capacity => '8/15',	:ship => K,	:tech_level => 'A',	:ep => 2
    Computer.create :model=> 5, :price => 5, :tonnage => 12, :capacity => '25',	:ship => P,	:tech_level => 'B',	:ep => 3
    Computer.create :model=> '5fib', :price => 0,	:tonnage => 12, :capacity => '25',	:ship => P,	:tech_level => 'B',	:ep => 3
    Computer.create :model=> 6, :price => 7, :tonnage => 15, :capacity => '35',	:ship => R,	:tech_level => 'C',	:ep => 5
    Computer.create :model=> '6fib', :price => 4,	:tonnage => 15, :ship => '35',	:capacity => R,	:tech_level => 'C',	:ep => 5
    Computer.create :model=> 7, :price => 9, :tonnage => 20, :ship => '50,'	:capacity => Y,	:tech_level => 'D',	:ep => 7
    Computer.create :model=> '7fib', :price => 8,	:tonnage => 20, :ship => '50',	:capacity => Y,	:tech_level => 'D',	:ep => 7
    Computer.create :model=> 8, :price => 1, :tonnage => 30, :ship => '70',	:capacity => Y,	:tech_level => 'E',	:ep => 9
    Computer.create :model=> '8fib,' :price => 2,	:tonnage => 30, :ship => '70',	:capacity => Y,	:tech_level => 'E',	:ep => 9
    Computer.create :model=> 9, :price => 4, :tonnage => 0, :ship => '90', :capacity => Y, :tech_level => 'F', :ep => 12
    Computer.create :model=> '9fib', :price => 20, :tonnage => 0, :ship => '90', :ship => Y,:tech_level => 'F', :ep => 12
  end

  down do
  end
end
