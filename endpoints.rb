require 'sinatra'

# WARN  TCPServer Error: Address family not supported by protocol - socket(2)
# fixed (?) by:
set :bind, '0.0.0.0'

get '/alarm' do
  command = 'ruby file_download.rb&'
  system(command)
  "Hello Sinatra!"
end
