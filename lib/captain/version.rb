module Captain
  class Version

    def self.get
      Dir.chdir(File.expand_path(File.dirname(__FILE__)))
      Dir.chdir('../../')

      @properties = File.read('pipeline.properties')
      @increment = @properties[/major$|minor$|patch$/]
    end

    def self.change(version)
      new_increment = @properties.gsub(/(major$|minor$|patch$)/, version)

      File.open('pipeline.properties', 'w') { |file| file.puts new_increment }
    end
  end
end
