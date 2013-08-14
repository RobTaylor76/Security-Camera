require 'open-uri'
10.times do
  filename = Time.now.strftime("%Y_%m_%d_%H%M%S")
  open("images/#{filename}.jpg", 'wb') do |file|
    file << open('http://192.168.1.253:81/snapshot.cgi?user=GUEST&password=9999').read
  end
  sleep 1
end
