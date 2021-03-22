require "bundler/setup"
Bundler.require

ActiveRecord::Base.establish_connection({
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
})

require_all 'app'

# adds SQL query print outs to our terminal 
# as we navigate our application in the browser
ActiveRecord::Base.logger = Logger.new(STDOUT)



# require 'pry'
# require 'httparty'


# # require_relative '../lib/cli'
# require_relative '../lib/api'
# require_relative '../lib/clue'
# require_relative '../lib/category'
# require_relative '../lib/player'