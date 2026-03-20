def caesar_cipher(string, shift)

    # contains all letters of the alphabet in lowercase
    alphabet="abcdefghijklmnopqrstuvwxyz"
    letters_lower=alphabet.split("")
    letters_upper=alphabet.upcase.split("")

    letters_original=string.split("")
    letters_shifted=[]

    letters_original.each_with_index do |letter, index|        
        lower_index=letters_lower.index(letter)
        upper_index=letters_upper.index(letter)

        # If letter is a lowercase letter combined_index equals lower_index
        # if letter is an uppercase letter combined_index equals upper_index
        # if letter is not in alphabet combined_index is nil
        combined_index=lower_index ? lower_index : upper_index

        unless combined_index
            letters_shifted[index] = letter
        else
            combined_index += shift

            # wrap the alphabet until it is in the range 0 - 25
            while combined_index < 0
                combined_index += alphabet.length
            end

            while combined_index >= alphabet.length
                combined_index -= alphabet.length
            end

            # set the correct letter based on the capitilization of the letter
            if lower_index
                letters_shifted[index] = letters_lower[combined_index]
            else
                letters_shifted[index] = letters_upper[combined_index]
            end
            
        end

    end # end of loop that sets letters_shifted


    return letters_shifted.join

end

# all 3 should remain as Hello world!
puts caesar_cipher("Hello world!", 0)
puts caesar_cipher("Hello world!", 26)
puts caesar_cipher("Hello world!", -26)


# should wrap the letters and make it "zab"
puts caesar_cipher("xyz", 2)

# should wrap the alphabet in the other direction and make it yZA
puts caesar_cipher("aBC", -2)

# should turn into "Bmfy f xywnsl"
puts caesar_cipher("What a string!", 5)
