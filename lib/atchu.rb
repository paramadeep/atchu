require "atchu/connection"
require "atchu/model_file_maker"
require "atchu/model"

module Atchu
  extend self

  def load db_config
    Connection.connect db_config
    generate_models
  end

  private
  def generate_models
     tables = Connection.get.tables
     models = tables.map{|table| Model.for_table(table)}
     models.each{|model|ModelFileMaker.new(model).write_to "tmp"}
  end
end
