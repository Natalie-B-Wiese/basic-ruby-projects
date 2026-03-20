def substrings (string, dictionary)
    
    dictionary.reduce(Hash.new(0)) do |result, dict_word|
        
        # increment result[dict_word] by the number of times that dict_word appears in string
        
        # the select with split(" ") method doesn't work because select will only say once per word ('na' in 'banana' will say 1 instead of 2)
        # result[dict_word] += (string.downcase.split(" ").select { |word| word.include?(dict_word.downcase) }).count
        

        start_index=0
        end_index=0
        accumulator=0

        until end_index > string.length
            current_string=string[start_index, end_index].downcase
            
            if current_string.include?(dict_word.downcase)
                start_index += (current_string.index(dict_word.downcase)) + 1
                accumulator+=1
            else
                end_index+=1
            end
        end


        unless accumulator==0
            result[dict_word] += accumulator
        end

        result

    end


end



dictionary = ["ba", "na"]

# should return {"ba" => 1, "na" => 2}
p substrings("banana", dictionary)



dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# should return { "below" => 1, "low" => 1 }
p substrings("below", dictionary)

# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
p substrings("Howdy partner, sit down! How's it going?", dictionary)