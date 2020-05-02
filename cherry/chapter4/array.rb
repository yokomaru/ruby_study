## 配列
a = [1,2,3]
a.delete_at(1) # [1,3]

a,b = [1, 2]
c,d = [10]

quo_rem = 14.divmod(3) # 商と余りを配列で返す
"商#{quo_rem[0]}、余り#{quo_rem[1]}"
quotient,remainder = 14.divmod(3)
"商#{quotient}、余り#{remainder}"

## ブロック
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n
end
sum

### 奇数だけ消す
a = [1, 2, 3, 1, 2, 3]
a.delete_if do |n|
  n.odd?
end
a
numbers = [1, 2, 3, 4]
numbers.each do
  sum1 += 1
end

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  # sum_valueはブロック内の変数なのでブロック街では見れない
  sum_value = n.even? ? n + 10 : n
  sum += sum_value
end
sum

numbers = [1, 2, 3, 4]
sum = 0
sum_value = 100
numbers.each do |n|
# sum_valueはブロック外にもあるが、ブロック内ではブロック引数のsum_valueが優先される
# シャドーイング
  sum_value = n.even? ? n + 10 : n
  sum += sum_value
end
sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n| sum += ｎ end
sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each {|n| sum += ｎ }
sum

## 配列のメソッド
### map/collect
### 各要素に対してブロックを評価した結果を新しい配列にして返します
#### mapなし
numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each {|n| new_numbers << n * 10 }
new_numbers
#### mapあり
numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map {|n| n * 10 }
new_numbers

### select/find_all/reject
#### selectエイリアスfind_all
numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値あが真になった要素だけあつめられる
even_numbers = numbers.select{ |n| n.even? }
even_numbers

#### reject
numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値が偽になった要素だけあつめられる
non_multiples_of_three = numbers.reject{ |n| n % 3 == 0  }
non_multiples_of_three

### select/find_all/reject
#### selectエイリアスfind_all
numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値あが真になった要素だけあつめられる
even_numbers = numbers.select{ |n| n.even? }
even_numbers

### find/detect
numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値あが真になった要素の最初だけ
even_number = numbers.find{ |n| n.even? }
even_number

### inject/reduce
#### たたみコミを行う
numbers = [1, 2, 3, 4]
sum = 0
numbers.each {|n| sum += n}
sum

numbers = [1, 2, 3, 4]
sum = numbers.inject(0) {|result, n| result += n}
sum
['Mon', 'Tue', 'Wen', 'Thur', 'Fri', 'Sat'].inject('Sun') {|result, s| result += s}

### &とシンボル
['ruby','java','perl'].map {|s| s.upcase }
['ruby','java','perl'].map {&:upcase}

[1, 2, 3, 4, 5, 6].select {|n| n.odd? }
[1, 2, 3, 4, 5, 6].select {&:odd?}

#### 以下はダメ
#### ブロックの中でメソッドじゃなくて演算子
#### ブロックの中のメソッドで引数私てる
#### ブロックの中で複数の文を実行している


## Range
### .. 最後の含む
### ... 最後含まない
(1..5).class
(1...5).class

(1..5).include?(1)
(1..5).include?(4.9)
(1..5).include?(5)
(1..5).include?(6)


(1...5).include?(1)
(1...5).include?(4.9)
(1...5).include?(5)
(1...5).include?(6)

1..(5.include?(1))

a = [1, 2, 3, 4, 5]
a[1..3]
a = 'abcdefg'
a[1..3]

### 異常未満
def liquid?(temperature)
  # 0度異常１００度未満であれば液体と判断する
  0 <= temperature && temperature < 100
end
liquid?(-1)
liquid?(0)
liquid?(99)
liquid?(100)

#### range使う
def liquid?(temperature)
  # 0度異常１００度未満であれば液体と判断する
  (0..100).include?(temperature)
end
liquid?(-1)
liquid?(0)
liquid?(99)
liquid?(100)

### case文
#### 年齢に応じて料金
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
charge(3)
charge(12)
charge(16)
charge(25)

## 配列を作成
(1..5).to_a
(1...5).to_a

('a'..'e').to_a
('a'...'e').to_a

('bad'..'bag').to_a
('bad'...'bag').to_a

[*1..5]
[*1...5]

numbers = (1..4).to_a
sum = 0
numbers.each{|n| sum += n}
sum
sum = 0
(1..4).each{|n| sum += n}
sum

numbers = []
# 1から10まで２つ飛ばしで繰り返し処理を行う
(1..10).step(2) {|n| numbers <<  n}
numbers

##　添字
### 添字２つで位置と取得する長さ
a = [1, 2, 3, 4, 5]
a[1, 3]

### values_at
#### 取得したい要素を複数指定
a = [1, 2, 3, 4, 5]
a.values_at(0, 2, 4)

### 配列の長さ-1で最後のようそ
a = [1 ,2 ,3]
# 最後の要素を取得する
a[a.size - 1]

a[-2, 2]

a = [1, 2, 3]
a.last
a.last(2)
a.first
a.first(2)

a= [1]
b = [2, 3]
a.concat(b)

### 配列の和酒豪、差集合、積集合
a = [1, 2, 3]
b = [3, 4, 5]

a | b # 和集合(２つの配列の重複しないように全部返す)
a - b # 差集合 (右の配列の中で左にあるものを取り除く)
a & b # 積集合(共通するもののみ)
####　非破壊的

####　Setを使えば効率的に使える
##### require 'set'
require 'set'
a = Set.new([1,2,3])
b = Set.new([3,4,5])
a | b
a - b
a & b

#### 多重代入で残りの全要素を配列として受け取る
e , *f = 100, 200 ,300
e
f

### １つの配列を複数の引数として展開する
a =[]
a.push(1)
a.push(2, 3)

a =[]
b = [2, 3]
a.push(1)
a.push(b)

a =[]
b = [2, 3]
a.push(1)
a.push(*b)


### メソッドの可変長の引数制限のない引数
# def メソッド名(1,2, *可変長)
#　処理
#　end

def greeting(*names)
  "#{names.join('と')}、こんにちわ"
end

greeting('田中さん')
greeting('田中さん','山田さん')
greeting('田中さん','山田さん','鈴木さん')

### 非破壊的に連結する

a = [1, 2, 3]
[a]
[*a]
[-1, 0, *a , 4, 5]

### 等しい配列かどうか判断する
[1,2,3] == [1,2,3]

### %記法
['apple', 'melon' ,'orange']
%w! apple melon orange!
%w(apple melon orange)
%w(
  apple
  melon
  orange
)

%w(big\ apple small\ melon orange)
prefix = 'This is'
%W(#{prefix}\ an\ apple small\nmelon orange)

### 文字列を配列に
'Ruby'.chars
'Ruby,Java,Perl,PHP'.split(',')

a = Array.new
a = []

a = Array.new(5)
#=> [nil, nil, nil, nil, nil]

a = Array.new(5, 0)
# => [0, 0, 0, 0, 0]
# ブロックで要素を繰り返す
a = Array.new(10){|n| n % 3 + 1}
# => [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]

# 配列初期値注意点
a = Array.new(5, "default")
a

str = a[0]
str

str.upcase!
str

a

# irb(main):107:0> a = Array.new(5, "default")
# => ["default", "default", "default", "default", "default"]
# irb(main):108:0> a
# => ["default", "default", "default", "default", "default"]
# irb(main):109:0>
# irb(main):110:0> str = a[0]
# => "default"
# irb(main):111:0> str
# => "default"
# irb(main):112:0>
# irb(main):113:0> str.upcase!
# => "DEFAULT"
# irb(main):114:0> str
# => "DEFAULT"
# irb(main):115:0>
# irb(main):116:0> a
# => ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]
# 別々のようで一つの配列オブジェクトに紐づいているから全部大文字になる
# 配列の全要素が同じ文字列オブジェクトを参照しているから

# ブロックを初期値で私
a = Array.new(5){"default"}
a

str = a[0]
str

str.upcase!
str

a

# irb(main):117:0> a = Array.new(5){"default"}
# => ["default", "default", "default", "default", "default"]
# irb(main):118:0> a
# => ["default", "default", "default", "default", "default"]
# irb(main):119:0>
# irb(main):120:0> str = a[0]
# => "default"
# irb(main):121:0> str
# => "default"
# irb(main):122:0>
# irb(main):123:0> str.upcase!
# => "DEFAULT"
# irb(main):124:0> str
# => "DEFAULT"
# irb(main):125:0>
# irb(main):126:0> a
# => ["DEFAULT", "default", "default", "default", "default"]
# irb(main):127:0>
# ブロックは呼ばれるたびに新しく文字列を作成する　別の文字列を参照する

## ミュータブル、イミュータブル
#イミュータブル　
#数値、しんぼる、treu/false/nil

a = Array.new(5,0)
a

n = a[0]
n

n.nagative!(負の数)

#[]や<<を使った文字列操作 配列のように操作できる
a = 'abcde'
a[2]
a[1, 3]
a[-1]

a[0] = 'X'
a
a[1, 3] = 'Y'
a << 'PQR'
a

## 添字つきの繰り返し処理
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index{|fruit, i| puts "#{i}: #{fruit}"}

### 添字つきの繰り返し処理
fruits = ['apple', 'orange', 'melon']
fruits.map.with_index{|fruit, i| "#{i}: #{fruit}"}

### delete_if
fruits = ['apple', 'orange', 'melon']
fruits.delete_if.with_index{|fruit, i| fruit.include?('a') && i.odd?}

## 添字を０以外
fruits = ['apple', 'orange', 'melon']
fruits.each.with_index(1){|fruit, i| puts "#{i}: #{fruit}"}

## 配列がブロック引数に渡される
dimentions = [
  [10, 20],
  [30, 40],
  [50, 60],
]

areas = []
  dimentions.each do |dimention|
    length = dimention[0]
    width = dimention[1]
    areas << length * width
  end
areas
# ブロック引数をふやす
areas = []
  dimentions.each do |length, width|
    areas << length * width
  end
areas

# ブロック引数をふやす
  dimentions.each do |length, width, foo, bar|
    p [length, width, foo, bar]
  end

# ブロック引数をふやす
dimentions = [
  [10, 20, 100],
  [30, 40, 200],
  [50, 60, 300],
]

  dimentions.each do |length, width|
    p [length, width]
  end


# ブロック引数をふやす
dimentions = [
  [10, 20],
  [30, 40],
  [50, 60],
]
  # lengthで配列を受け取ってしまう
  dimentions.each_with_index do |length, width, i|
    puts "length: #{length}, width: #{width}, i:#{i}"
  end

  # ブロック引数をふやす
dimentions = [
  [10, 20],
  [30, 40],
  [50, 60],
]

  # 配列をバラして使う
  dimentions.each_with_index do |dimention, i|
    length = dimention[0]
    width = dimention[1]
    puts "length: #{dimention[0]}, width: #{ dimention[1]}, i:#{i}"
  end

  # ブロック引数を（）で囲むと配列の要素を別々の引数として受け取れる
  dimentions.each_with_index do |(length, width), i|
    puts "length: #{length}, width: #{width}, i:#{i}"
  end

  ### ブロックローカル変数
  numbers = [1, 2, 3 ,4]
  sum = 0
  # 外のsumとは別
  numbers.each do |n; sum|
    sum = 10
    sum += n
    p sum
  end
  sum

 ## 繰り返し以外でも
  File.open("./sample.txt", "w") do |file|　# openはクローズもしてくれる
    file.puts("1行")
    file.puts("2行")
    file.puts("3行")
  end

## do..end {}の結合度の違い
a =[1, 2, 3]
a.delete(100)
a.delete(100) do
  'NG'
end

a.delete 100  do
  'NG'
end

a.delete 100{ 'NG' }

a.delete (100){ 'NG' }
sum = 0
5.times {|n| sum += n}
sum

## 様々な繰り返し
sum = 0
5.times{|n| sum += n}
sum

sum = 0
5.times{sum += 1}
sum

## updto downto

a = []
14.downto(10) {|n| a << n}
a

## step
  a = []
  ## 上限値、一度に増減する大きさ
  1.step(10, 2){|n| a << n}
  a
  a = []
  ## 上限値、一度に増減する大きさ
  10.step(1, -2){|n| a << n}
  a

## while 真であれば
# while 条件式
# 繰り返したい処理
# end

a = []
while a.size < 5
  a << 1
end

## 1行でもかける
a = []
while a.size < 5 a << 1　end

a = []
a << 1 while a.size < 5
a

a=[]
while false
   a << 1
end

## 最低一回だけはやる
begin
  a << 1
end while false

## until 偽であれば
# until 条件式
# 繰り返したい処理
# end

a =[10, 20, 30, 40 ,50]
until a.size <= 3
  a.delete_at(-1)
end
a

### 無限ループなりうる

## for 変数 in 配列やハッシュ
# 繰り返したい処理
# end
numbers = [1, 2, 3 ,4]
sum = 0
# 外のsumとは別
for n in numbers
  sum += n
end
sum

## loop
### 無限ループ(Kernelメソッド)
while true

end
loop do

end

numbers = [1, 2, 3, 4, 5]

loop do
  n = numbers.sample
  puts n
  break if n == 5
end

numbers = [1, 2, 3, 4, 5]

while true
  n = numbers.sample
  puts n
  break if n == 5
end

## 繰り返しの制御(while until forでも使えるf)
### break一番内側のループ
numbers = [1, 2, 3, 4, 5].shuffle
numbers.each do |n|
  puts n
  break if n == 5
end

fruits = ['apple', 'orange', 'melon']
numbers = [1, 2, 3]

 fruits.each do |fruit|
  numbers.shuffle.each do |n|
    puts "#{fruit}, #{n}"
    break if n == 3
  end
 end

### throw catch(例外処理とは関係ない)
fruits = ['apple', 'orange', 'melon']
numbers = [1, 2, 3]
catch :done do
 fruits.shuffle.each do |fruit|
  numbers.shuffle.each do |n|
    puts "#{fruit}, #{n}"
    if fruit == 'orange' &&  n == 3
    throw :done
    end
  end
 end
end

### タグが一致しないとダメ
fruits = ['apple', 'orange', 'melon']
numbers = [1, 2, 3]
catch :done do
 fruits.shuffle.each do |fruit|
  numbers.shuffle.each do |n|
    puts "#{fruit}, #{n}"
    if fruit == 'orange' &&  n == 3
    throw :foo
    end
  end
 end
end

### だい２ひきすう渡すとcathの戻り値
ret =
  catch :done do
    throw :done
  end
ret

ret =
  catch :done do
    throw :done, 123
  end
ret

### breakは処理、returnはメソッドからの脱出

## next
numbers = [1, 2, 3, 4, 5]
  numbers.each do |n|
    next if n.even?
    puts n
  end
## whileでも使える
  numbers = [1, 2, 3, 4, 5]
  i = 0
  while i < numbers.size
    n = numbers[i]
    i += 1
    next if n.even?
    puts n
  end

## 繰り返し処理が入れ子になっていうr場合は一番内側の内側のループだけ中断
fruits = ['apple', 'orange', 'melon']
numbers = [1, 2, 3, 4]
 fruits.each do |fruit|
  numbers.each do |n|
    next if n.even?
    puts "#{fruit}, #{n}"
  end
 end

## redo
### 繰り返し処理をやり直したい場合 その会の最初に戻る
foods = ["ピーマン","セロリ","きうり"]
foods.each do |food|
  print "#{food}は好きですか？"
  answer = ['はい','いいえ'].sample
  puts answer

  redo unless answer = "はい"
end
### 無限ループになりかねないので回数制限とかをする
### 繰り返し処理をやり直したい場合 その会の最初に戻る
foods = ["ピーマン","セロリ","きうり"]
count = 0
foods.each do |food|
  print "#{food}は好きですか？"
  answer = 'いいえ'
  puts answer
  count += 1
  redo if answer != "はい" &&  count < 2

  count = 0
end