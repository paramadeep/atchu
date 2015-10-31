require 'atchu/connection'
require 'atchu/table_to_arel_converter'
require 'atchu/model'

module Atchu
  extend self

  def for_db(db_config)
    Connection.connect db_config
    self
  end

  def generate_models_at(output_folder)
    Pathname.new(output_folder).children.each { |p| p.unlink }
    tables = Connection.get.tables
    models = tables.map { |table| Model.for_table(table) }
    models.each { |model| TableToArelConverter.new(model).write_to output_folder }
  end
end
