require "soap/rpc/standaloneserver"
require "pstore"

class BlogServer < SOAP::RPC::StandaloneServer

  def initialize(*args)
    super
    @blog = PStore.new("blog.pstore")
    self.level = Logger::Severity::DEBUG
    add_method(self, 'post', 'data')
    add_method(self, 'index')
    add_method(self, 'get', 'id')
  end

  # add a blog post
  def post(data)
    p data
    @blog.transaction do
      @blog[data.object_id] = {'title'=>data['title'],'message'=>data['message']}
    end
    data.object_id
  end

  # get all blog posts
  def index
    @blog.transaction(true) do
      return @blog.roots.map do |id|
        id
      end
    end
  end

  # get a blog post by id
  def get(id)
    p id
    @blog.transaction(true) do
      return @blog[id.to_i]
    end
  end

end

server = BlogServer.new("BlogServer",'urn:savon:blog', 'localhost', 8080)
trap('INT'){
  server.shutdown
}
server.start
