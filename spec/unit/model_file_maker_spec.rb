describe Atchu::ModelFileMaker,"ModelFileMaker" do
  before(:each) do
    @model = instance_double("Model", :table_name => "table", :class_name => "klass", :class_file_name => "klass_file", :primary_key => [:id,:name])
    @model_file = Atchu::ModelFileMaker.new(@model)
  end

  it "should create file for a model" do
    @model_file.write_to "tmp"
    expect(File).to exist("tmp/#{@model.class_file_name}.rb")
  end
end
