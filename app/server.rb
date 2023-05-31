require "socket"

class YourRedisServer
  def initialize(port)
    @port = port
  end

  def start
    puts("Logs from your program will appear here!")

    server = TCPServer.new(@port)
    client = server.accept

    client.gets
    response  = "+PONG\r\n"
    client.puts response

    client.close
  end
end

YourRedisServer.new(6379).startgit 