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
	:title => "My first Datamapper Todo List",
	:body => "A lot of text...",
	:created_at => Time.now
)



