DATA.flock(File::LOCK_EX | File::LOCK_NB) or abort 'Already Running'
time = Time.now
force = false
ARGV.each do|a|
  force = true if a == '--force'
end
unless force
  exit if (time.hour >= 20) || (time.hour < 7) #time box pictures to daylight
end
date = time.strftime("%Y_%m_%d")
directory = "images/#{date}"
unless Dir.exists? directory
  Dir.mkdir directory
end

2.times do
  timestamp = Time.now.strftime("%H_%M__%S")
  filename = "#{directory}/#{timestamp}.jpg"
  begin
    command = "raspistill -o #{filename} -t 1 -q 75 "
    system(command)
  rescue
  end
  sleep 0.25
end

__END__
DO NOT DELETE: used for locking
