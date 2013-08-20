DATA.flock(File::LOCK_EX | File::LOCK_NB) or abort 'Already Running'

require 'open-uri'
10.times do
  timestamp= Time.now.strftime("%Y_%m_%d_%H%M%S")
  filename = "images/#{timestamp}.jpg"
  open(filename, 'wb') do |file|
    begin
    file << open('http://192.168.1.253:81/snapshot.cgi?user=GUEST&password=9999').read
    rescue
    end
  end
  sleep 1
end

__END__
DO NOT DELETE: used for locking
