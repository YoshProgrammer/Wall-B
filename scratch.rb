require 'sqlite3'
# This is a gem for interacting with sqlite3 databases. Here's the docs: http://rdoc.info/github/luislavena/sqlite3-ruby


db = SQLite3::Database.new "wall.db" 
# The argument you pass in should match the .db file that was created in 
# your project directory when you ran the app.

p db.execute "select * from walls"
# HOLY WOW! An array of arrays. It's a bit of a pain to read though...

db.results_as_hash = true
p db.execute "select * from walls"
# EVEN BETTER! An array of hashes! Now we can see what data is in which column!

# Let's see what else we can do:

p db.class 
# This tells us what `datatype` the `db` variable is. 
# Look familiar? (See line 2!)


# If we want to figure out what this class does; we check the docs! 
#   http://rdoc.info/github/luislavena/sqlite3-ruby/SQLite3/Database



# Phew, that's a bit overwhelming! All those methods!
# We care most about:
# * `execute`
# * `table_info`

# Let's stick with those!

puts db.table_info('walls')
# What does this.. I mean... what?
# It's an array of column definitions! Now we know
# what the `walls` table looks like


p db.query("INSERT INTO walls (title, description, created_by) VALUES ('Awesome peeps', 'Tell me, who is the awesome?', 'Zee')")
# Cool, we just inserted some data! Notice the order of column names in
# the first set of parenthesis matches the order of the values
# in the second set of parenthesis.

# Here's MOAR DOCS describing how `inserts` work in sqlite:
#   https://www.sqlite.org/lang_insert.html

p db.query('SELECT * FROM walls')
# Cool, we can see the new wall we created from the command line!
