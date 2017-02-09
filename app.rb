require 'sequel'
require 'sinatra'
require 'sinatra/reloader'

db_path = File.dirname(__FILE__) + "/dbtable.db"
DB = Sequel.sqlite(db_path)

get '/' do
 erb :index
end

post '/comment' do
  if params[:uname]
    u_name = params[:uname]
  else
    u_name = "ななし"
  end
  message = params[:umessage]
 puts "#{u_name}#{message}"
  DB[:messagetable].insert(name: u_name, message: message)
end
