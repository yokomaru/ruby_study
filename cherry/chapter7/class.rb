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
## クラスの定義
class クラス名
end

##
class User
  def initialize
    puts 'initialized' # initiaizeは外部から呼べない
  end
end

user = User.new
user.initialize

class User
  def initialize(user,name)
    puts 'initialized' # initiaizeは外部から呼べない
  end
end

user = User.new #エラー
user = User.new("aa","ss") #initialize

# クラス公文の内部でメソッドを定義するとインスタンスメソッドとなる
class User
  def initialize(name)
    puts 'initialized' # initiaizeは外部から呼べない
  end

  def hello
    'Hello!'
  end
end

user = User.new #エラー
user.hello

##　いんスタンス変数とアクセスメソッド
# クラス公文の内部でメソッドを定義するとインスタンスメソッドとなる
class User
  def initialize(name)
    # initiaizeは外部から呼べない
    @name = name #@がつくのはインスタンス変数 同じインスタンスの中で共有される
  end

  def hello
    "Hello! I am #{@name}"
  end
end

user = User.new('Alice') #エラー
user.hello

## 一方メソッドやブロックの内部で作成される変数のことをローカる変数という
## 呼び出され鵜TB愛に毎回作り直される

# instane変数は代入する前にいきなり参照してもエラーにならない

class User
  def initialize(name)
    # initiaizeは外部から呼べない
    @name = name #@がつくのはインスタンス変数 同じインスタンスの中で共有される
  end

  def hello
     #shuffled_name = @name.chars.shuffle.join
    "Hello! I am #{shuffled_name}" # エラー
  end
end

user = User.new('Alice') #エラー
user.hello

# インスタンス変数はエラーが押しない

## インスタンス変数は外部から参照することができません
class User
  def initialize(name)
    # initiaizeは外部から呼べない
    @name = name #@がつくのはインスタンス変数 同じインスタンスの中で共有される
  end

  def name
    @name
  end
  # インスタンス変数を外部から変更するためのメソッド
  # =で終わるメソッドは変数に代入する様に形でできる
  def name=(value)
    @name = value
  end
end

user = User.new('Alice') #エラー
user.name= "bob"
user.name

## インスタンス変数の値を読み書きするメソッドのことを「アクセサメソッド」という
# ゲッターメソッドやセッターメソッドともいう
# rubyの場合単純にインスタンス変数の内容を外部から読み書きするのであればattr_accessorというメソッドを体躯な定数をしょうちゃくできる
## インスタンス変数は外部から参照することができません
class User
  attr_accessor :name
  def initialize(name)
    # initiaizeは外部から呼べない
    @name = name #@がつくのはインスタンス変数 同じインスタンスの中で共有される
  end

  def name
    @name
  end
end

user = User.new('Alice') #エラー
user.name= "bob"
user.name

class User
  attr_reader :name

  def initialize(name)
    # initiaizeは外部から呼べない
    @name = name #@がつくのはインスタンス変数 同じインスタンスの中で共有される
  end

  def name
    @name
  end
end

user = User.new('Alice') #エラー
user.name = "bob"
user.name
# 書き込み専用はwriter
class User
  attr_writer :name

  def initialize(name)
    # initiaizeは外部から呼べない
    @name = name #@がつくのはインスタンス変数 同じインスタンスの中で共有される
  end
age
  def name
    @name
  end
end

user = User.new('Alice') #エラー
user.name = "bob"
user.name
# カンマで渡すとふく数
class User
  attr_accessor :name, :age

  def initialize(name, age)
    # initiaizeは外部から呼べない
    @name = name
    @age = age
  end
end

user = User.new('Alicem',20) #エラー
user.name
user.age

## クラスメソッドの定義
## クラス公文の内部で普通に目そっどぉ亭日するとインスタンスメソッドにsる
class User
  attr_accessor :name, :age

  def initialize(name)
    @name = name
  end

  def hello
   "Hello! I am #{@name}" # エラー
 end
end

alice = User.new('Alicem')
alice.hello

bob = User.new('Bob')
bob.hello

class User
  attr_accessor :name, :age

  def initialize(name)
    @name = name
  end

  def hello
   "Hello! I am #{@name}" # エラー
 end
end

alice = User.new('Alicem')
alice.hello

bob = User.new('Bob')
bob.hello

## クラスメソッド
class クラスめい
  def self.クラスメソッド

  end
end


class クラスめい
  class << self
    def クラスメソッド
    end
  end
end


class User
  def initialize(name)
    @name = name
  end

  def self.create_users(names) # クラスオブジェクトの得意メソッド
      names.map do |name|
        User.new(name)
      end
  end

  def hello
    "Hello! I am #{@name}" # エラー
  end
end
names = ["yoko","kopo","nyasu"]
users = User.create_users(names)
users.each do |user|
  puts user.hello
end
# クラス中には定数を定義することもできます
class Product
  DEFAULT_PRICE = ０ #定数はクラスでもインスタンでもそっちでも呼び出せる
  attr_reader :name, :price

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new('A free movie')
product.price

## self
