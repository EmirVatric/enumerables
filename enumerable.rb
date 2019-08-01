public
def my_each
  (self.length).times do |number|
    yield(self[number])
  end
end

def my_each_with_index
  index = 0
  for i in self
    yield(self[index], index)
    index += 1
  end
end

def my_select
  result = []
  self.my_each do |item| 
    if yield(item)
      result << item 
    end
  end
  return result
end

def my_all?
  self.my_each { |item|
    if !yield(item)
      return false
    end
  }
  return true
end

def my_any?
  self.my_each { |item|
    if yield(item)
      return true
    end
  }
  return false
end

def my_none?
  result = true
  self.my_each{|item| result = false if yield(item)}
  return result
end

def my_count
  count = 0
  self.my_each do |item|
      if yield(item)
          count += 1
      end
  end

  return count
end

def my_map(&block)
  result = []
  unless block == nil
    self.my_each do |item| 
      result << block.call(item) 
    end
  else
    return result
  end
 
  return result

end

def my_inject start
  self.my_each{|item| start = yield(start,item)}
  start
end

def multiply_els(arr)
  arr.my_inject(1) { |item, num| item * num }
end



arr =[1111,2,3]
words = ['test', 'one', 'two', 'three']
#p arr.each {|a| a}
#p arr.my_each {|a| a}

#arr.each_with_index { |val,index| puts "index: #{index} for #{val}" if val < 30}
#arr.my_each_with_index { |val,index| puts "index: #{index} for #{val}" if val < 30}

#arr.my_select { |item| item > 2 }

#p words.my_all? {|word| word.length >= 4}
#p words.my_any? {|word| word.length >= 6}

#p arr.my_none? {|number| number == 1111}


#arr.my_none? {|number| number == 1111}  
#arr.my_none? {|number| number == 5}  

#p arr.my_map 
#p arr.my_map { |item| item + 2 }

#arr.my_inject(0) {|result, item| result + item}

#p multiply_els(arr)



