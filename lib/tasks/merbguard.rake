desc "Print all classes that include DataMapper::Resource."
  task :print_dm_resources => :merb_env do
    DataMapper::Resource.descendants.each do |resource|
      puts resource
    end
  end

namespace :db do
  


  def interesting_tables
    DataMapper::Resource.descendants.reject! do |table|
      [Merb::DataMapperSessionStore].include?(table)
    end
  end

  desc "Dump data from the current environment's DB."
  task :dump_data => :merb_env do
    dir = Merb.root_path("config/data/#{Merb.env}")
    FileUtils.mkdir_p(dir)
    FileUtils.chdir(dir)

    interesting_tables.each do |table|
      puts "Dumping #{table}..."

      File.open("#{table}.yml", 'w+') { |f| YAML.dump(table.all.collect(&:attributes), f) }
    end
  end

  desc "Load data (from config/data/<environment>) into the current environment's DB."
  task :load_data => :merb_env do
    dir = Merb.root_path("config/data/#{Merb.env}")
    FileUtils.mkdir_p(dir)
    FileUtils.chdir(dir)

    adapter = DataMapper.repository(:default).adapter

    interesting_tables.each do |table|
      table.transaction do |txn|
        puts "Loading #{table} data..."
        YAML.load_file("#{table}.yml").each do |fixture|
          adapter.execute("INSERT INTO #{table.name.pluralize.snake_case} (#{fixture.keys.join(",")}) VALUES (#{fixture.values.collect {|value| adapter.send(:quote_column_value, value)}.join(",")})")
        end
      end
    end
  end
end