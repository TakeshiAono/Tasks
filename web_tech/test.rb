require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'top.html.erb')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')

# この一行を追記
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.cgi')
server.mount('/goya2.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.cgi')

server.start