DATA.flock(File::LOCK_EX | File::LOCK_NB) or abort 'Already Running'

date = Time.now.strftime("%Y_%m_%d")
directory = "images/#{date}"
unless Dir.exists? directory
  Dir.mkdir directory
end
10.times do
  timestamp= Time.now.strftime("%H_%M__%S")
  filename = "#{directory}/#{timestamp}.jpg"
  begin
    command = "raspistill -o #{filename} -t 1 -vf -q 50"
    system(command)
  rescue
  end
  sleep 0.25
end

__END__
DO NOT DELETE: used for locking
