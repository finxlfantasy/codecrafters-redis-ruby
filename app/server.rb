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
      request = client.gets.chomp

      case request
      when "PING"
        client.puts("+PONG\r\n")
      when "QUIT"
        client.puts("+Goodbye!\r\n")
        break
      else
        client.puts("-Unknown command\r\n")
      end
    end

    client.close
  end
end

YourRedisServer.new(6379).start