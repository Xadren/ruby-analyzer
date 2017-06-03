stop_words = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

# Count the number of characters.
total_chars = text.length
total_chars_nospaces = text.gsub(/s+/, '').length

# Count words, sentances and paragrapgs
word_count = text.split.length
sentance_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# Check what percentage of words of the text are interesting
words = text.scan(/\w+/)
key_words = words.select { |word| !stop_words.include?(word)}

# Summarize the text by cherry picking choice sentances
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }


puts "#{line_count} lines"
puts "#{total_chars} characters"
puts "#{total_chars_nospaces} characters excluding whitespaces"
puts "#{word_count} words"
puts "#{sentance_count} sentances"
puts "#{paragraph_count} paragraphs"
puts "#{word_count / sentance_count} words per sentance (average)"
puts "#{sentance_count / paragraph_count} sentances per paragraph (average)"
puts "#{((key_words.length.to_f / word_count.to_f) * 100).to_i}\% of words are interesting"

if ARGV[1] == "-s" 
	puts ideal_sentences.join(".\n")
end










