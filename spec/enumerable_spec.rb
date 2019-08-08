require './lib/enumerable.rb'

describe '#my_each' do
let(:array) { [2,5,7,3,7] } 
  it 'returns full array' do
    expect do
      array.my_each {|a| print a}
    end.to output("25737").to_stdout
  end

  it 'returns empty array' do
    expect do
      array.my_each {|a| print a}
    end.not_to output("").to_stdout
  end
end

describe '#my_each_with_index' do
let(:array) { [2,5,7,3,7] }
  it 'returns index and value' do
    expect do
      array.my_each_with_index {|val, index| puts "index: #{index} for #{val}" if val == 5}
    end.to output("index: 1 for 5\n").to_stdout
  end
  it 'doesnt return index and value' do
    expect do
      array.my_each_with_index {|val, index| puts "index: #{index} for #{val}" if val == 5}
    end.not_to output("").to_stdout
  end
end

describe '#my_select' do
let(:array) { [2,5,7,3,7] }
  it 'returns all values less than 7' do
    expect(array.my_select {|a| a < 7}).to  eql([2,5,3])
  end
  it 'returns values greater or  than 6' do
    expect(array.my_select {|a| a < 7}).not_to eql([7,7])
  end
end

describe '#my_all?' do
let(:array) { [4,4,4,4,4] }
  it 'tests if all elements in array are 4' do
    expect(array.all? {|a| a == 4}).to  eql(true)
  end
  it 'returns false even if all elements are 4' do
    expect(array.all? {|a| a == 4}).not_to  eql(false)
  end
end

describe '#my_any?' do
let(:array) { [2,5,7,3,7] }
  it 'test if any of element in array is 4' do
    expect(array.my_any? {|a| a == 4}).to eql(false)
  end
  it 'test if any of element in array is 4 and returns true' do
    expect(array.my_any? {|a| a == 4}).not_to eql(true)
  end
end

describe '#my_none?' do
let(:array) { [2,5,7,3,7] }
  it 'returns true if none inside of array is 4' do
    expect(array.my_none? {|a| a == 4}).to eql(true)
  end
  it 'returns false if none inside of array is 4' do
    expect(array.my_none? {|a| a == 4}).not_to eql(false)
  end
end

describe "#my_count" do
  let(:array) { [2,5,7,3,7] }
    it "returns the numbers of element in an array" do
      expect(array.my_count {|a| a}).to eql(5)
    end
    it "returns wrong numbers of element in an array" do
      expect(array.my_count {|a| a}).not_to eql(6)
    end
end

describe "#my_map" do
  let(:array) { [2,5,7,3,7] }
  it "creates a new array containing the values returned by the block" do
    expect(array.my_map {|x| x + 2}).to eql([4,7,9,5,9])
  end
  it "creates a new empty array" do
    expect(array.my_map {|x| x + 2}).not_to eql([])
end
end

describe "#my_inject" do
  let(:array) { [2,5,7,3,7] }
  it "reduces all elements of the array additionning all to output a single element" do
    expect(array.my_inject(0) {|a,b| a + b}).to eql(24)
  end
  it "returns wrong sum" do
    expect(array.my_inject(0) {|a,b| a + b}).not_to eql(77)
  end
end

describe "#multiply_els" do
let(:array) { [2,5,7,3,7] }
  it 'multiply all numbers in array' do
    expect(multiply_els(array)).to eql(1470)  
  end
  it 'doesnt multiply all numbers in array' do
    expect(multiply_els(array)).not_to eql(14)  
  end
end


