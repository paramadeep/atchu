module Atchu 
  module Queries 
    extend self

    def primary_key table_name
      sql = <<-SQL
SELECT               
  pg_attribute.attname 
FROM pg_index, pg_class, pg_attribute 
WHERE 
  pg_class.oid = '#{table_name}'::regclass AND
  indrelid = pg_class.oid AND
  pg_attribute.attrelid = pg_class.oid AND 
  pg_attribute.attnum = any(pg_index.indkey)
  AND indisprimary
      SQL
    end
  end
end


