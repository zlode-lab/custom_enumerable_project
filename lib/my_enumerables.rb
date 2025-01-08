module Enumerable

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_all?
    for elem in self
      return false unless yield(elem)
    end
    return true
  end

  def my_any?
    for elem in self
      return true if yield(elem)
    end
    return false
  end

  def my_none?
    for elem in self
      return false if yield(elem)
    end
    return true
  end

  def my_count
    if block_given? 
      count = 0
      for elem in self
        count += 1 if yield(elem)
      end
      return count
    else
      return self.size
    end
  end

  def my_map
    arr = []
    for elem in self
      arr.push(yield(elem))
    end
    return arr
  end

  def my_inject(value)
    for elem in self
      value = yield(value, elem)
    end
    value
  end
  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
    self
  end

end
