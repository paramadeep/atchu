require "erubis"

module Atchu 
  class ModelFileMaker

    def initialize input_model
      @model = input_model
    end

    def write_to output_folder
      file_content = get_file_content
      write_to_file output_folder,file_content
    end

    private
    attr_accessor :model
    def get_file_content
      eruby = Erubis::Eruby.new(File.read(File.join(File.expand_path("./../template/", __FILE__), 'model.eruby')))
      eruby.result({:class_name => model.class_name,:table_name=>model.table_name,:primary_key=>model.primary_key})
    end

    def write_to_file output_path,file_content
      FileUtils.mkdir_p(output_path)
      File.open(File.join(Dir.pwd,output_path, "#{model.class_file_name}.rb"), "w") { |file| file.write file_content }
    end

  end
end


