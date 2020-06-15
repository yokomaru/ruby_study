print 'Text?:'
text = gets.chomp

begin
  print 'Pattern?:'
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
rescue => e
  puts "Invalid pattern: #{e.message}"
end

matches = text.scan(regexp)
if matches.size > 0
  puts "Matched: #{matches.join('、')}"
else
  puts "Nothing matched."
end

# Text?:aaa-aaa-vvv
# Pattern?:[1-6+
# Invalid pattern: premature end of char-class: /[1-6+/

