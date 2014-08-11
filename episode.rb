require 'dm-core'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

configure :production do

end

class Episode
  include DataMapper::Resource

  property  :id,               Serial
  property  :title,            String, :length => 255
  property  :length,           Integer
  property  :show_notes,       Text
  property  :released_on,      Date
  property  :soundcloud_id,    Integer
  property  :interviewee_name, String, :length => 255

  def released_on=date
    super Date.strptime(date, '%m/%d/%Y')
  end
end

DataMapper.finalize
