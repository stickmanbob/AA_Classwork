require "byebug"
def range(start, ending)
    return [] if ending <= start 
    num = range(start,ending-1)
    num  +  [ending-1]
end

# p range(1,5)
# p range(1,-1)
# p range(1,1)
# p range(1,2)


def exp(b, n)
  return 1 if n.zero?
  b * exp(b, n-1)
end

def exp(b, n)
  return 1 if n.zero?
  return b if n == 1

  if n.even?
    exponent = exp(b, n/2)
    exponent * exponent
  else
    exponent = exp(b, (n-1) / 2)
    b * (exponent * exponent)
  end
end

# p exp(2,2)
# p exp(2,3)

class Array
  def deep_dup
    results = []
    self.each do |ele|
      unless ele.is_a?(Array)
        results << ele
      else
        results << ele.deep_dup
      end
    end
    results
  end
end

# arr = [1, [2], [3, [4]]]
# p arr
# puts arr.object_id

# arr.each do |ele|
#   if ele.is_a?(Array)
#     puts ele
#     puts ele.object_id
#   end
# end
# puts '-' * 26

# result  = arr.deep_dup
# p result
# puts result.object_id
# result.each do |ele|
#   if ele.is_a?(Array)
#     puts ele
#     puts ele.object_id
#   end
# end

# p result[2]

def fib(n)
  return [1] if n == 1
  return [1,1]if n == 2
  seq = fib(n-1)
  seq << seq[-1] + seq[-2] 
  seq
end

def fib_iter(n)
  seq = [1,1]
  return [1] if n == 1
  until seq.length == n
    seq << seq[-1] + seq[-2]
  end
  seq
end

# p fib(1)
# p fib(2)
# p fib(3)
# p fib(5)

def bsearch(array, target)
  mid = array.length/2

  if target == array[mid]
    return mid
  elsif array.length == 1
    return nil
  elsif target < array[mid]
    return bsearch(array[0...mid], target)
  else
    leftarray = array[0..mid]
    index = bsearch(array[mid+1..-1], target)
    return nil if !index
    return leftarray.length + index
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return [] if array.empty?
    return array if array.length == 1
    mid = array.length/2
    leftarray = array[0...mid]
    rightarray = array[mid..-1]

    merge(merge_sort(leftarray), merge_sort(rightarray))
    
end

def merge(left,right)
    merged = []
    i = 0
        while left.length > 0 || right.length > 0
            last_right = right.last || 0
            last_left = left.last || 0
          if last_right > last_left
              merged.unshift(right.pop)
          elsif last_right < last_left
              merged.unshift(left.pop)
          elsif last_left == last_right
              merged.unshift(left.pop) if left.last
              merged.unshift(right.pop) if right.last
          end
        end
    merged
end

p merge_sort([3,2,4, 9, 9, 5])
p merge_sort([3,2,0,8,3,1, 5])
