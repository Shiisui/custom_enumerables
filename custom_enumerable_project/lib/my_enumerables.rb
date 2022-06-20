module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    self.my_each do |element|
      yield([element, i]) if block_given?
      i += 1
    end
  end

  def my_select 
    result = []
    boolean = ""
    self.my_each do |element| 
      boolean = yield(element).to_s if block_given?
      if boolean == "true" 
        result << element
      end
    end
    result
  end

  def my_all? 
    boolean = []
    counter = 0
    self.my_each do |element|
      boolean << yield(element).to_s if block_given?
      if boolean.length == self.length
        boolean.my_each do |element2|
          if element2 == "true"
            counter += 1
          end
        end
      end
    end

    if counter == self.length 
      return true 
    else
      return false
    end
  end

  def my_any? 
    boolean = ""
    got_any = 0
    self.my_each do |element| 
      boolean = yield(element).to_s if block_given?
      if boolean == "true"
        got_any += 1
      end
    end
    return true if got_any >= 1
    return false
  end

  def my_none? 
    boolean = ""
    got_any = 0
    self.my_each do |element| 
      boolean = yield(element).to_s if block_given?
      if boolean == "true"
        got_any += 1
      end
    end
    return false if got_any >= 1
    return true
  end

  def my_count
    count = 0 
    array = []
    boolean = ""
    self.my_each do |element| 
      boolean = yield(element).to_s if block_given?

      if boolean == "true"
        count += 1
      end
    end
  return count if block_given?
  return self.length
  end

  def my_map 
    result = []
    self.my_each do |element| 
      result << yield(element)
    end
    result
  end

  def my_inject(sum)
    self.my_each do |element|
    sum = yield([sum, element]) if block_given?
    end
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element) if block_given?
    end
  end
end
