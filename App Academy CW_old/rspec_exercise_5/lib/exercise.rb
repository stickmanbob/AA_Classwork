def zip (*arrays)
    length = arrays.length 
    length2 = arrays[0].length
    arr_2d = Array.new(length2) {Array.new()}
    
    arrays.each_with_index do |subarr, idx1|
        subarr.each_with_index do |ele, idx2|
            
            arr_2d[idx2] << arrays[idx1][idx2]

        end
    end
    arr_2d
end



def prizz_proc(arr, prc1, prc2)
    arr.select{|ele| (prc1.call(ele) || prc2.call(ele)) &&  !(prc1.call(ele) && prc2.call(ele))}
end

def zany_zip(*arrays)
    length = arrays.length 
    lengths = []
    arrays.each do |eleanor|
       lengths << eleanor.length
    end

    length2 = lengths.max 
    arr_2d = Array.new(length2) {Array.new()}
    
    arrays.each_with_index do |subarr, idx1|
        # subarr.each_with_index do |ele, idx2|
        i = 0
        while i < length2 

            arr_2d[i] << arrays[idx1][i]
            i+=1
        end
    end
    arr_2d
end

def maximum(array, &proc)
    return nil if array.length == 0
    previous_max = proc.call(array[0])
   previous_max_ele = array[0]
   array.each { |ele|
        if proc.call(ele) >= previous_max
            previous_max = proc.call(ele)
            previous_max_ele = ele
        end
    }
        previous_max_ele
end



def my_group_by(arr, &prc)
    hash = Hash.new([])
    arr.each { |ele|
    val = prc.call(ele)
    hash[val] += [ele]
    }
    hash
end





def max_tie_breaker(array,tie_breaker,&sorter)
    return nil if array.length == 0
    previous_max = sorter.call(array[0])
    previous_max_val = array[0] 

    array.each do|ele|
        if sorter.call(ele) > previous_max
            previous_max = sorter.call(ele)
            previous_max_val = ele
        elsif sorter.call(ele) == previous_max
            if tie_breaker.call(ele) > tie_breaker.call(previous_max_val)
                previous_max = sorter.call(ele)
                previous_max_val = ele
            end


            
        end
        
    end
    previous_max_val
end


    # block_array = []
    # proc_array = []
    
    # array.each do |ele|
    #   block_array << sorter.call(ele)
    # end

    # block_max =  block_array.max 
    # block_array.count {|block_array.max|}
         

        
    # endrevious_max_val 

    def silly_syllables(sentence)
        words = sentence.split(" ")
        words.map! do |word|
            if vowel_count(word) >= 2
                remove_letters(word)
            else
                word
            end
        end
        words.join(' ')
    end

    def vowel_count(word)
       vowels = "aeiouAEIOU"
       count = 0
       word.each_char do |char|
            count +=1 if vowels.include?(char)
       end
       count
    end

    def remove_letters(word)
        vowels = "aeiouAEIOU"
        i1 = 0
        i2 = 0
        (0...word.length).each do |i|
            if vowels.include?(word[i])
                i1 = i
                break 
            end
        end

        i = word.length - 1
        while i > 0
            if vowels.include?(word[i])
                i2 = i
                break 
            end
            i -= 1
        end
    word[i1..i2]
    end