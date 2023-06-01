require "socket"

class YourRedisServer
  def initialize(port)
    @port = port
  end

  def start
    puts("Logs from your program will appear here!")

    loop do
      request = client.gets.chomp
        response = "+PONG\r\n"
      client.puts(response)
    end 
    client.close
  end
end

YourRedisServer.new(6379).start