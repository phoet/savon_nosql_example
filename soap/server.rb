require "soap/rpc/standaloneserver"

class BlogServer < SOAP::RPC::StandaloneServer

  # Expose our services
  def initialize(*args)
    super
    self.level = Logger::Severity::DEBUG
    add_method(self, 'post', 'data')
  end

  # add a blog-post
  def post(data)
    p data
    data.id
  end

end
begin
  server = BlogServer.new("BlogServer",'urn:savon:blog', 'localhost', 8080)
  trap('INT'){
    server.shutdown
  }
  server.start
rescue => err
  puts err.message
end
