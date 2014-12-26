require "yaml"

module Atchu
  module Connection
    extend self

    def connect yml_file
      return if yml_file.empty?
      if @connection.blank?
        ActiveRecord::Base.establish_connection(options)
        @connection = ActiveRecord::Base.connection
      end
      @connection
    end

    def get
      @connection
    end
  end
end
