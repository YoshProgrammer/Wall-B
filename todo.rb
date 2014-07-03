require 'data_mapper'
require 'sqlite3'
DataMapper.setup(:default, "sqlite:todo.db")

class Post

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime

end

DataMapper.finalize
DataMapper.auto_upgrade!

@post = Post.create(
	:title => "My first Todo List",
	:body => "A lot of text...",
	:created_at => Time.now
)

#====== Questions =====
# Rather confused on how this whole thing works. I'm not very confident with the whole get, put, post, delete.

