def combine_anagrams(words)
  anagram_list = Array.new
  anagram_hash = Hash.new
  index = 0 # Keeps track of which array to add the anagram to

  words.each do |word|
    key = word.downcase.chars.sort.join # Sorts the word alphabetically and creates the key to store in the hast
    #p anagram_list
    #p anagram_hash
    if anagram_hash.has_key?(key)
      anagram_list[ anagram_hash[key] ].push(word) # Adds the word to its corresponding array
    else
      anagram_hash[key] = index
      anagram_list[index] = Array.new.push(word)
      index = index + 1
    end
  end
  return anagram_list
end


input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 
#p combine_anagrams(input)