require "atchu/queries"
require "active_support/inflector"

class Model 
  attr_accessor :table_name

  def self.for_table table_name
    model = Model.new
    model.table_name = table_name
    model
  end

  def class_name
    "#{table_name.classify}Db"
  end

  def file_name
    table_name.classify.underscore
  end

  def primary_key
    query = Atchu::Queries.primary_key table_name
    keys = Atchu::Connection.get.select_all(query).rows
    return "" if keys.eql? []
    keys.reduce(:+).map{|x|x.intern}.to_s.gsub("[","").gsub("]","")
  end

end
