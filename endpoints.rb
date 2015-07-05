require 'sinatra'

# WARN  TCPServer Error: Address family not supported by protocol - socket(2)
# fixed (?) by:
set :bind, '0.0.0.0'

get '/alarm' do
  begin
  command = 'ruby take_pictures.rb&'
  system(command)
  rescue
  end
  "Alarm Registered!"
end

get '/cleardown' do

  begin
  command = 'rm -r /home/rob/work/security-cam/images/*'
  system(command)
  rescue
  end
  "Files Cleared Down!"
end
