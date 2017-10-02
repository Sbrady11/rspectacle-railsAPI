def bubble_sort(array)
	for i in 0..array.length - 2
		for j in i+1..array.length - 1
			left = array[i]
			right = array[j]
			if left > right
				array[i] = right
				array[j] = left
			end
		end
	end
	array
end