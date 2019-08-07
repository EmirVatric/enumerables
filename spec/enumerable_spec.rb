require './lib/enumerable.rb'

describe '#my_each' do
let(:array) { [2,5,7,3,7] } 
  it 'returns full array' do
    expect do
      array.my_each {|a| print a}
    end.to output("25737").to_stdout

  end
end

describe '#my_each_with_index' do
let(:array) { [2,5,7,3,7] }
  it 'returns index and value' do
    expect do
      array.my_each_with_index {|val, index| puts "index: #{index} for #{val}" if val == 5}
    end.to output("index: 1 for 5\n").to_stdout
  end
end

describe '#my_select' do
let(:array) { [2,5,7,3,7] }
  it 'returns all values less than 7' do
    expect(array.my_select {|a| a < 7}).to  eql([2,5,3])
  end
end

describe '#my_all?' do
let(:array) { [4,4,4,4,4] }
  it 'tests if all elements in array are 4' do
    expect(array.all? {|a| a == 4}).to  eql(true)
  end
end

describe '#my_any?' do
let(:array) { [2,5,7,3,7] }
  it 'test if any of element in array is 4' do
    expect(array.my_any? {|a| a == 4}).to eql(false)
  end
end

describe '#my_none?' do
let(:array) { [2,5,7,3,7] }
  it 'returns true if none inside of array is 4' do
    expect(array.my_none? {|a| a == 4}).to eql(true)
  end
end