require 'sequel'
require 'sinatra'
require 'sinatra/reloader'

db_path = File.dirname(__FILE__) + "dbtable.db"
DB = Sequel.sqlite(db_path)

get '/' do
 erb :index
end



# post '/comment' do
#   if params[:name]
#     u_name = params[:name]
#   else
#     u_name = "ななし"
#   end
#   message = params[:umessage]
#
#   DB[:messagetable].insert(name: u_name, message: message)
# end
