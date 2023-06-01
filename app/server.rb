require "socket"

class YourRedisServer
  def initialize(port)
    @port = port
  end

  def start
    puts("Logs from your program will appear here!")

    server = TCPServer.new(@port)
    client = server.accept
    loop do
      response = "+PONG\r\n"
      client.puts(response)
    end 

    client.close
  end
end

YourRedisServer.new(6379).start