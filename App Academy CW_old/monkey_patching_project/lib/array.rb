# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array

    def span
       return self.max - self.min if self.length >0

        nil
    end

    def average
        if self.length > 0 
            return self.sum/self.length.to_f
        else
            return nil
        end
    end

    def median
       len = self.length
        return nil if len == 0 
       sorted = self.sort
       if len.odd?
            middle = len/2 
            return sorted[middle]
       else
            mid1 = sorted[len/2 -1] 
            mid2= sorted[len/2]
            return [mid1,mid2].average 
            
       end
    end

    def counts
        count = Hash.new(0)
        self.each {|ele| count[ele]+=1}
        count 
    end

    def my_count(val)
        count = 0
        self.each {|ele| count +=1 if ele == val}
        count 
    end

    def my_index(val)
        self.each_with_index do |ele,i|
            if ele == val
                return i
            end
        end
            return nil
        
    end

    def my_uniq
        newarr = []
        dupes = []
        self.each do |ele|
            if !dupes.include?(ele)
                newarr << ele
                dupes << ele
            end
        end
        newarr
    end
    
    def my_transpose
        
        len = self.length  
        transposed = Array.new(len) {Array.new(len)}
        
        out = 0
        while out < len
            inn = 0
            while inn < len
               transposed[inn][out] = self[out][inn]
                inn+=1
            end
            out +=1
        end
        transposed 
    end

    
  
end
