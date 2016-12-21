# File readlines returns an arrays using normal split.
lines = File.readlines("oliver.txt")

line_count = lines.size
text = lines.join
total_characters = text.length
total_characters_no_spaces = text.gsub(/\s+/, '').length
word_count = text.split.length

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_no_spaces} (excluding spaces)"
puts "#{word_count} words"
