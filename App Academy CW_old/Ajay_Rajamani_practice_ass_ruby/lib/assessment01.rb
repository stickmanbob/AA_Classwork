class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    i = 0
    accumulator, i = self[0], 1 if !accumulator
    while i < self.length
      ele = self[i]
      accumulator = prc.call(accumulator, ele)
      i+=1
    end
    accumulator
    
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).each {|fac| return false if num%fac == 0}
  true
end

def primes(num)
  return [] if num == 0
  primes = []
  i = 2
  while primes.length < num 
    
    if is_prime?(i)
      primes << i
    end
    i+=1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1,1] if num == 2
  facs = factorials_rec(num-1)
  facs << (num-1) * facs[-1]
  facs 
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dup_hash = Hash.new {|h,k| h[k] = []}
    self.each_with_index do |ele,i|
      dup_hash[ele] << i
    end
    dup_hash.select {|k,v| v.length > 1}
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = []
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        subs << self[i..j]
      end
    end
    subs.select!{|sub| sub.length > 1}
    subs.select!{|sub| sub == sub.reverse}
    subs
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    prc ||= Proc.new {|l,r| l <=> r}
    return self if self.length <= 1
    mid = self.length/2
    left = self[0...mid]
    right = self[mid..-1]
    Array.merge(left.merge_sort,right.merge_sort,&prc) 
    
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    while left.length > 0 || right.length > 0
      first_left = left.first 
      first_right = right.first
      if prc.call(first_left,first_right) == 1
        merged.push(right.shift)
      else
        merged.push(left.shift)
      end
    end
    
    merged

  end
end
