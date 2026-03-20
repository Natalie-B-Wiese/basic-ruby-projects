# returns the number of times that needle appears in word. Case sensitive
def num_matches_in_word(word, needle)
    start_index = 0
    end_index = needle.length-1
    accumulator=0

    until end_index > word.length
        word_partial=word[start_index, end_index]
        
        if word_partial.include?(needle)
            start_index += (word_partial.index(needle)) + 1
            accumulator+=1
        else
            end_index+=1
        end
    end

    return accumulator
end


def substrings (string, dictionary)
    
    dictionary.reduce(Hash.new(0)) do |result, dict_word|

        dict_word=dict_word.downcase

        # select all words that have a match somewhere in them
        words_with_matches=string.downcase.split(" ").select {|word| word.include?(dict_word)}

        # get the number of times that dictionary word appears in each word
        num_matches = words_with_matches.reduce(0) { |accumulator, word| accumulator + num_matches_in_word(word, dict_word) }

        result[dict_word] = num_matches unless num_matches==0

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