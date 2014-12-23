require "erubis"

module Atchu 
  class ModelFileMaker

    def self.for_model model 
      file_maker = ModelFileMaker.new
      file_maker.modle = model
      file_maker
    end

    def write_to output_folder
      file_content = get_file_content_for model
      write_to_file output_folder,file_content
    end

    private
    attr_accessor :model,:output_folder

    def get_file_content_for model 
      eruby = Erubis::Eruby.new(File.read(File.join(File.expand_path("./template/", __FILE__), 'model.eruby')))
      eruby.result(model)
    end

    def write_to_file output_path,file_content
      File.open(File.join(output_path, "#{model.class_file_name}.rb"), "w") { |file| file.write file_content }
    end

  end
end


