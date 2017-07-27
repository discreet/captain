require 'English'

if Dir.exist?('commit-msg')
  task :commitmsg do
    ARGV.each { |i| task(i.to_sym) }
    FileList['commit-msg/*'].each do |file|
      cmd = "#{file} #{ARGV[1]}"
      system(cmd)
      next if $CHILD_STATUS.exitstatus.zero?
      exit $CHILD_STATUS.exitstatus unless $CHILD_STATUS.exitstatus.zero?
    end
  end
end
