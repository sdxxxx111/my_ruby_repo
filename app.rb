require 'sequel'
require 'sinatra'
require 'sinatra/reloader'
require 'time'
require 'json'

db_path = File.dirname(__FILE__) + "/dbtable.db"
DB = Sequel.sqlite(db_path)

get '/' do
  @messages = DB[:messagetable].all
  erb :index
end

post '/message' do
  u_name = params[:uname]
  message = params[:umessage]
  DB[:messagetable].insert(name: u_name, message: message, messagedate: Time.now)
end

post '/messageshow' do
    showmessage = DB[:messagetable].order(Sequel.desc(:messagedate)).first
    data = {"id" => showmessage[:id], "name" => showmessage[:name], "message" => showmessage[:message], "messagedate" => showmessage[:messagedate]}
    content_type :json
    @data = data.to_json
end

post '/messagedel' do
  id = params[:id]
  id.each{|id_num|
    DB[:messagetable].where(id: id_num).delete
  }
end
