def greeting
  puts 'おはよう'
  puts 'こんばんは'
end

# irb(main):526:0> def greeting
# irb(main):527:1>   puts 'おはよう'
# irb(main):528:1>   puts 'こんばんは'
# irb(main):529:1> end
# => :greeting
# irb(main):530:0> greeting
# おはよう
# こんばんは
# => nil

def greeting
  puts 'おはよう'
  puts 'こんばんは'
end

greeting do
  puts 'こんにちは'
end

# おはよう
# こんばんは
# => nil

def greeting
  puts 'おはよう'
  # ブロック処理を呼び出す
  yield
  yield
  puts 'こんばんは'
end

greeting do
  puts 'こんにちは'
end

# おはよう
# こんにちは
# こんばんは
# => nil
greeting
#LocalJumpError (no block given (yield))

