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
    tables.each { |table| TableToArelConverter.new(table).write_to output_folder }
  end
end
