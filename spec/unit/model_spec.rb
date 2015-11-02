describe Model,"model with table name, 'car_parts'" do

  before(:each) do
    @model = Model.for_table('car_parts')
  end

  it 'model class name is CarPartDb' do
    expect(@model.class_name).to eq('CarPartDb')
  end

  it 'model file name is car_part' do
    expect(@model.file_name).to eq('car_part')
  end
end

