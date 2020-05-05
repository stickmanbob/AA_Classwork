class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_num = 0
    self.each_with_index do |ele, i|
      if i % 3 == 0
        if ele.is_a?(Integer)
          hash_num += ele + i 
        else
          hash_num += ele.length + i  
        end
      elsif i % 3 == 1
         if ele.is_a?(Integer)
          hash_num += ele * i 
        else
          hash_num += ele.length * i  
        end
      else
        if ele.is_a?(Integer)
          hash_num += ele / i 
        else
          hash_num += ele.length / i  
        end
      end
    end
    hash_num.hash
  end

  
end

class String
  def hash
    alphabet = ("A".."z").to_a
    converted = self.split("")
    result = converted.map do |char|
      if alphabet.include?(char)
        char = alphabet.index(char)
      else
        char.to_i
      end
    end
    result.hash
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
