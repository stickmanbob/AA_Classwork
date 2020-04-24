def strange_sums(arr)
    count = 0
    i1 = 0

    while i1 < arr.length
        i2 = i1

        while i2 < arr.length
            if arr[i1] + arr[i2] == 0
                count += 1
            end

            i2 += 1
        end

        i1 += 1
    end

    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, prod)

    i1 = 0
    while i1 < arr.length
        i2 = i1 + 1

        while i2 < arr.length
            if arr[i1] * arr[i2] == prod
                return true
            end

            i2 += 1
        end

        i1 += 1
    end
    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    result = ""

    str.each_char do |char|
        if hash.include?(char)
            hash[char].times {result += char}
        else
            result += char
        end
    end

    result
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(n)
    (1..n).each do |root|
        if root * root == n
            return true
        end
    end
    false 
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def anti_prime?(n)
    divs = divisors(n)

    (1...n).each do |num|
        if divisors(num) >= divs
            return false
        end
    end

    true
end

def divisors(n)
    count = 0

    (1..n).each do |div|
        if n % div == 0
            count += 1
        end
    end

    count
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(matrix1,matrix2)
    i1 = 0
    results = Array.new(matrix1.length) {Array.new(matrix1[0].length)}

    while i1 < matrix1.length 
        i2 = 0
        while i2 < matrix1[0].length 
            results[i1][i2] = matrix1[i1][i2] + matrix2[i1][i2]
            i2 +=1
        end
        i1 +=1
    end
    results 
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*n)
    result = []
    min = n.min

    (1..min).each do |div|
        result << div if n.all? { |ele| ele % div == 0 }
    end

    result
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
    
    seq = [1,1,2]
    if n == 1
        return seq[0]
    elsif n == 2 
        return seq[1]
    end


    while seq.length != n
        seq << (seq[-1] + seq[-2] + seq[-3])
    end
    return seq[-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24

def matrix_addition_reloaded(*matrices)
    if !matrices.all? { |matrix| matrix.length == matrices[0].length && matrix[0].length == matrices[0][0].length }
        return nil
    end

    matrices.inject { |acc, el| matrix_addition(acc, el) }
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(twodarray)
    twodarray.any? do |subarr|
        return true if subarr.all? {|ele| ele == subarr[1]}
    end

    (0...twodarray[0].length).each do |x|
        arr = []
        (0...twodarray.length).each do |y|
            arr << twodarray[y][x]
        end
      return true  if arr.all? {|ele| ele == arr[0]}
    end
    false 
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(twodarray)
    squaragonal1(twodarray) || squaragonal2(twodarray)
end

def squaragonal2(twodarray)
    idx = 0
    prv_value1 = twodarray[0][twodarray.length - 1]
    while idx <twodarray.length
        idx2 = ((twodarray.length - 1) - idx)
        return false if twodarray[idx][idx2] != prv_value1 

        idx += 1
    end
    true
end

def squaragonal1(twodarray)
    i = 0
    prv_value = twodarray[0][0]
    while i <twodarray.length
        return false if twodarray[i][i] != prv_value
        i += 1
    end
    true
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(n)
    triangle = [[1],[1,1]]
    return [triangle[0]] if n == 1
    return triangle if n == 2

    (n-2).times do
        layer = [1]
        (0...((triangle[-1].length) -1)).each do |i|
            layer << triangle[-1][i] + triangle[-1][i+1] 
        end
        layer << 1
        triangle << layer
    end
    triangle 
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def mersenne_prime(n)
    primes = []
    i = 1
    while primes.length < n
        candidate = (2**i - 1)
        primes << candidate if prime?(candidate)
        i += 1
    end

    primes[-1]
end



def prime?(n)
    return false if n < 2

    (2...n).each do |factor|
        return false if n % factor == 0
    end

    true
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    encoding = 0
    word.each_char do |char|
        encoding += alpha.index(char) + 1
    end

    i = 1
    tri_num = 1
    while tri_num < encoding
        i+=1
        tri_num = (i * (i + 1)) / 2
    end
    return encoding == tri_num 
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)
    collapsible = true
    deleted  = false
    while collapsible
        collapsible = false
        i = 0

        while i < arr.length - 1 
            if (arr[i] == arr[i + 1] + 1) || (arr[i] == arr[i + 1] - 1)
                arr.delete_at(i)
                arr.delete_at(i)
                collapsible = true
                
                i = -1
            end

            i += 1
        end
    end

    arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(array,n)
    results = []
    array.each do |num|
        if n > 0
            placeholder = num
            n.times { placeholder = next_prime(placeholder)}
            results << placeholder
        elsif n < 0
            placeholder = num
            x = -1 * n
            x.times {placeholder = previous_prime(placeholder)}
            results << placeholder
        end
    end




    results
end

def next_prime(n)
    
    i = n+1
    while true
        if prime?(i)
            return i
        else
            i+=1
        end
    end
end

def previous_prime(n)
    return nil if !n 
    i = n-1
    if n<=2
        return nil
    end

    while true
        if prime?(i)
            return i
        else
            i -=1
        end
    end


end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
#  p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
#  p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
#  p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
#  p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
#  p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
#  p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
#  p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
#  p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
#  p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]