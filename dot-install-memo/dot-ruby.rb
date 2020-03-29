# 04 オブジェクトを理解しよう
# 全てがオブジェクト(便利な命令を持っている)
# .length,.reverse,.round など　オブジェクトの種類による
# String,Floatなど
# 実際の値はインスタンスと呼ぶ

 #05 数値オブジェクトを使おう
p 4.8.class
p 4.8.method

# + - * / % **
p 10 + 3
p 10 * 3
p 2.4 * 3
p 10 / 3 # 3
p 10 % 3 #あまり
p 10.0 / 3 # 3.333
p Rational(2, 5) + Rational(3, 4)  # 2/5  3/4
p 2/5r + 3/4r

p 52.6.round
p 52.6.floor
p 52.6.ceil

p 52.6.ceil
# "" 特殊文字 式典会
# ''

puts "hell\no world\td" # optionキーを押しながら、¥キー
puts 'hell\no world\td'

# 式典会
puts "price #{3000 * 4}"
puts 'price #{3000 * 4}'

# 変数
name = "taguchi"
puts "hello #{name}"

# + *
puts "hello " + "world"
puts "hello " * 10

 #07 ?や!がついたメソッドを使おう
 # 文字列で使える

 # !
 # - upcase 表示大文字にするだけ
 # - upcase! 元の文字も大文字にする(破壊的メソッド)
# - downcase reverse
 name = "taguchi"
 puts name.upcase
 puts name
 puts name.upcase!
 puts name

 # ? 真偽値をかえす
 p name.empty? # false
 p name.include?("G") #true

#08 配列オブジェクトを使おう
 colors =["red","blue","yellow"]

 p colors[0] # 添字
 p colors[-1]# 後ろから
 p colors[0..2]　# 0から２まで
 p colors[0...2] # 0から２の直前まで
 p colors[5]

 colors[0] = "pink"
 colors[1..2] = ["white", "black"]
 colors.push("gold")
 colors << "silver"
 p colors
 p colors.size
 p colors.sort

 #09 ハッシュオブジェクトを使おう
 # -key / value

 # taguchi 200
 # fkoji 400

 scores = {"taguchi" => 200, "fkoji" => 400}
 scores = {:taguchi => 200, :fkoji => 400}
 scores = {taguchi: 200, fkoji: 400}

 p scores[:taguchi]
 scores[:fkoji] = 600
 p scores

 p scores.size
 p scores.keys
 p scores.values
 p scores.has_key?(:taguchi)

#10 オブジェクトを変換してみよう
 x = 50
 y = "3"

 p x + y # String can't be coerced into Integer
 p x + y.to_i
 p x + y.to_f #浮動少数
 p x.to_s + y

 scores = {taguchi: 200, fkoji: 400}
 p scores.to_a.to_h

 #11 %記法を使ってみよう
 puts "he\"llo"
 putsh 'he\'llo'

 puts %Q(he"llo)
 puts %(he"llo)
 puts %q(he'llo)

 p ["red", "blue"]
 p ['red', 'blue']

 p %W(red blue)
 p %w(red blue)

  #12 書式付きで値を埋め込もう
  # "文字列"　% 値
  # %s 文字列
  # %d　整数
  # %f　浮動小数点数

  p "name: %s" % "taguchi"
  p "name: %10s" % "taguchi"
  p "name: %-10s" % "taguchi"

  p "id: %05d, rate: %10.2f" % [355, 3.284]
  # prinf 書式月で表示
  # sprinf　値を返す

  printf("name: %10s\n", "taguchi")
  printf("id: %05d, rate: %10.2f" ,355, 3.284)

  sprintf("name: %10s\n", "taguchi")
  sprintf("id: %05d, rate: %10.2f" ,355, 3.284)

  #13 ifで条件分岐をしてみよう
  # > < >= <= == !=
  # &&(AND) ||(OR) !(NOT)
  score = gets.to_i

  if score > 80 then
    puts "great!"
  elsif score > 60
    puts "good"
  else
    puts "so so "
  end
 　# 短縮
  puts "great!" if score > 80

# case

signal = gets.chomp

case signal
when "red"
  puts "stop!"
when "green" ,"blue"
  puts "go!"
when "yellow"
  puts "caution!"
else
  puts "w"
end

# while
i = 0

while i < 10 do
  puts "#{i}:hello"
  # i = i + 1
  i += 1
end

# times

10.times do |i|
  puts "#{i}: hello"
end

10.times {|i| puts "#{i}: hello"}

#16 for､eachを使ってみよう
# for
for i in 15..20 #do
  p i
end

for name ,score in {taguchi:200, floji:400} do
  puts "#{name}: #{score}"
end

for color in ["red", "blue"] do
  p color
end

# each 集合的オブジェクトのメソッド的に動く
(15..20).each do |i|
  p i
end

["red", "blue"].each do |color|
  p color
end

{taguchi:200, floji:400}.each do |name ,score|
  puts "#{name}: #{score}"
end

for color in ["red", "blue"] do
  p color
end

# loop
i = 0
loop do
  p i
  i += i
end

10.times do |i|
  if i == 7 then
    #break #止める
    next　# 続ける
  end
  p i
end

#18 メソッドを作ってみよう
def sayHi(name) # 引数
  score = 80
  #puts "hi! #{name}"
  #"hi! #{name}"
  return "hi! #{name}"
end

p sayHi
p score

#19 クラスを作ってみよう
class User
  attr_accessor :name
  # getterだけattr_reader :name
  # setter: name=(value)　自動的にname(更新)
  # getter: name nameにアクセスするメソッド(取得)
  def initialize(name)
    @name = name #インスタンス変数はインスタンス内であれば使える
  end

  def sayHi
    # self(インスタンス自身)
    # self.name ->@name
    puts "hi! i am #{@name}"
    puts "hi! i am #{self.name}"
    puts "hi! i am #{name}"
  end

end

tom = User.new("tom")
tom.name = "tom Jr."
p tom.name
tom.sayHi　#レシーバ

bob = User.new("bob")
bob.sayHi

bob = User.new("bob")
bob.sayHi

 #21 クラスメソッド､クラス変数を使おう
 # クラスメソッド
 # クラス変数

class User

  @@count = 0
  VERSION = 1.1

  def initialize(name)
    @@count += 1
    @name = name #インスタンス変数はインスタンス内であれば使える
  end

  def sayHi
    # self(インスタンス自身)
    # self.name ->@name
    puts "hi! i am #{@name}"
  end

  def self.info
    puts "#{VERSION User.class, #{@@count} instances"
  end

end

tom = User.new("tom")
bob = User.new("bob")
steve = User.new("steve")
User.info
p User::VERSION

#22 クラスを継承してみよう
# User: 親クラス　super class
# AdminUser: 子クラス, Sub Class
class adminUser < User

  def sayHello
    puts "Hello from #{@name}"
  end

  # オーバーライド
  def sayHi
    puts "Hi from admin"
  end

end

tom = AminUser.new("tom")
tom.sayHi
tom.sayHello

#23 メソッドのアクセス権を理解しよう
# - public 通常はデフォルトで
# - procted
# - private　レシーバーを指定できない
# new initialize class


class User

  def sayHi
    puts "hi!"
    sayPrivate
    #self.sayPrivate
  end

  private

  def sayPrivate
    puts "private!"
  end

end

class AdminUser < User

  def sayHello
    puts "hello!"
    sayPrivate
  end

  # サブクラスからもよびだせるし、オーバーライドもできる
  def sayPrivate
    puts "private admin!!"
  end
end

#User.new.sayPrivate
User.new.sayHi
AdminUser.new.sayHello
AdminUser.new.sayPrivate

#24 モジュールで名前空間を作ろう
# module
# - 名前空間

def movie_encode;end

def movie_export;end

Movie.encode
Movie.export

module Movie

  VERSION = 1.1

  def self.encode
    puts "encoding..."
  end

  def self.export
    puts "encoding..."
  end

end

Movie.encode
Movie.encode
p Movie::VERSION

 #25 ミックスインを使ってみよう
 # module
 # -ミックスイン　継承関係にないメソッドを共通化できる

module Debug
  def info #selfを付けずにインスタンスメソッドにする
    puts "#{self.class} debug info"
  end
end
end

class Player
  include Debug
end

class Monster
  include Debug
end

Player.new.info
Monster.new.info

 #26 例外を扱ってみよう

x = gets.to_i

begin
  p 100/x
rescue =>
  p ex.message
  p ex.class
  puts "stopped"
ensure
  puts "--END--"
end

#　自分で例外処理作りたいとき
class MyErro < StandardError; end

x = gets.to_i

begin
  if x ==3
    raise MyError
  end
  p 100 /x
rescue MyError
  puts "not 31"
rescue =>
  p ex.message
  p ex.class
  puts "stopped"
ensure # 絶対実行したい処理
  puts "--END--"
end