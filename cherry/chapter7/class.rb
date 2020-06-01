# ユーザのデータを作成する
users = []
users << {first_name: 'Alice', last_name: "Ruby", age: 20}
users << {first_name: 'Bob', last_name: "Python", age: 30}

# ユーザを表示する
users.each do |user|
  puts "氏名: #{user[:first_name]} #{user[:last_name]},年齢#{user[:age]}"
end

# ユーザのデータを作成する
users = []
users << {first_name: 'Alice', last_name: "Ruby", age: 20}
users << {first_name: 'Bob', last_name: "Python", age: 30}

# 誌名を作成するメソッド

def full_name(user)
  "#{user[:first_name]} #{user[:last_name]}"
end

users.each do |user|
  puts "氏名: #{full_name(user)},年齢#{user[:age]}"
end

# irb(main):017:0> users[0][:country] = 'Japan'
# => "Japan"
# irb(main):018:0> users[0][:first_name] = 'miho'
# => "miho"
# irb(main):019:0> users[0]
# => {:first_name=>"miho", :last_name=>"Ruby", :age=>20, :country=>"Japan"}

# Userクラスを定義する
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

# ユーザのデータを作成する
users = []
users << User.new('Alice', "Ruby", 20)
users << User.new('Bob',"Python", 30)

def full_name(user)
  "#{user.first_name} #{user.last_name}"
end

users.each do |user|
  puts "氏名: #{full_name(user)}, 年齢: #{user.age}"
end

# irb(main):025:0> users[0].first_name
# => "Alice"
# irb(main):026:0> users[0].first_nam
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):26
# NoMethodError (undefined method `first_nam' for #<User:0x00007fa4700d7d40>)
# Did you mean?  first_name

# Userクラスを定義する
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

# ユーザのデータを作成する
users = []
users << User.new('Alice', "Ruby", 20)
users << User.new('Bob',"Python", 30)

users.each do |user|
  puts "氏名: #{user.full_name}, 年齢: #{user.age}"
end

## クラスは一種のデータ型。
## クラスは設計図
## クラスからオブジェクトを作る
## クラスをもとに作られたものはオブジェクト/インスタンス
alice = User.new('Alice', "Ruby", 20)
bob = User.new('Bob',"Python", 30)

alice.full_name
bob.full_name

## first_nameメソッドのレシーバーはusers(メソッドを呼び出された側)
## オブジェクトが持つ動作や振る舞いをメソッド
## レシーバーとメッセージともいうsmalltalk
users = User.new('Alice', "Ruby", 20)
users.first_name

##ステート：オブジェクトごとに保持されるデータをオブジェクトの状態と呼ぶこともある

## 属性(アトリビュート、プロパティ)
## オブジェクトの状態は外部から取得したり変更したりできる場合はある
class User
  attr_accessor :first_name
end

user = User.new('Alice', "Ruby", 20)
users.first_name
users.first_name = 'アリス'
users.first_name

## おぬジェクトから取得・設定できる値のことを属性と呼ぶ　名刺
