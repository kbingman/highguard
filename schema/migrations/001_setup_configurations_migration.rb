migration 1, :setup_configurations  do
  up do
    Configuration.create :name => 'Needle/Wedge', :modifier => '1.2', :streamlined => 'streamlined'
    Configuration.create :name => 'Cone', :modifier => '1.1', :streamlined => 'streamlined'
    Configuration.create :name => 'Cylinder', :modifier => '1', :streamlined => 'partial'
    Configuration.create :name => 'Close Structure', :modifier => '0.6', :streamlined => 'partial'
    Configuration.create :name => 'Sphere', :modifier => '0.7', :streamlined => 'partial'
    Configuration.create :name => 'Flattened Sphere', :modifier => '0.8', :streamlined => 'streamlined'
    Configuration.create :name => 'Dispersed Structure', :modifier => '0.5', :streamlined => 'non-streamlined'
    Configuration.create :name => 'Planetoid', :modifier => '0', :streamlined => 'non-streamlined'
    Configuration.create :name => 'Buffered Planetoid', :modifier => '0', :streamlined => 'non-streamlined'
  end

  down do
  end
end
