desc 'Syntax and static code validation'
task :validate do
  Dir['*/**/*'].each do |file|
    sh "ruby -c #{file}" unless File.directory?(file)
  end

  sh 'rubocop -C false'
end
