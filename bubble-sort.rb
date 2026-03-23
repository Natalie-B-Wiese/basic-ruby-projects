# iteration should begin at 1.
def bubble_sort_iteration! (arr, iteration)

    #p "bubble sort iteration #{iteration}"

    for left_index in 0...(arr.length-iteration)

        right_index=left_index+1

        if (arr[left_index]>arr[right_index])
            #p "swap #{arr[left_index]} with #{arr[right_index]}"

            old_right_value=arr[right_index]

            arr[right_index]=arr[left_index]
            arr[left_index]=old_right_value
        end
    end

    return arr
end

# this method mutates arr
def bubble_sort (arr)

    for iteration in 1...(arr.length)
        bubble_sort_iteration!(arr, iteration)
    end

    return arr
end



p bubble_sort([5, 1, 4, 2, 8])

# [0,2,2,3,4,78]
p bubble_sort([4,3,78,2,0,2])
