## オープンクラスとモンキーパッチ
## Rubyはクラスの継承に制限がない
## StringクラスやArrayクラスなど、組込ライブラリのクラスであっても継承して独自のクラスで定義できる

class MyString < String
end

s = MyString.new('Hello')
s
s.class

class MyArray < Array

end

a = MyArray.new()
a << 1
a << 2
a
a.class

# rb(main):001:0> class MyString < String
# irb(main):002:1> end
# => nil
# irb(main):003:0>
# irb(main):004:0> s = MyString.new('Hello')
# => "Hello"
# irb(main):005:0> s
# => "Hello"
# irb(main):006:0> s.class
# => MyString
# irb(main):007:0>
# irb(main):008:0> class MyArray < Array
# irb(main):009:1>
# irb(main):010:1> end
# => nil
# irb(main):011:0>
# irb(main):012:0> a = MyArray.new()
# => []
# irb(main):013:0> a << 1
# => [1]
# irb(main):014:0> a << 2
# => [1, 2]
# irb(main):015:0> a
# => [1, 2]
# irb(main):016:0> a.class
# => MyArray

## 上書きできる　オープンに更新できる
class String
  def shuffle
    chars.shuffle.join
  end
end

s = 'Hello, Iam ALice'
s.shuffle
s.shuffle

# irb(main):007:0> s = 'Hello, Iam ALice'
# => "Hello, Iam ALice"
# irb(main):008:0> s.shuffle
# => "mcAe ailIe ,LHol"
# irb(main):009:0> s.shuffle
# => "IHeoel, iamLc Al"

#railsではオープンクラスを積極的に活用し便利メソッドを定義できる
# キャメルクラスからスネークケースに変換
'MyString'.underscore
# レシーバーが引数の配列に含まれていればtrueをかえす
numbers = [1,2,3]
2.in?(numbers)
5.in?(numbers)

## 既存のメソッドを上書きすることもできる　モンキーパッチ
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}"
  end
end

user = User.new('Alice')
user.hello

class User
  def hello
    "#{@name}さん、今日わ！"
  end
end

user.hello


# irb(main):012:0> user.hello
# => "Hello, Alice"
# irb(main):020:0> user.hello
# => "Aliceさん、今日わ！"

class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}"
  end
end

# モンキーパッチを当てるために再オープンする
class User
  # 既存のエイリアス追加
  alias hello_original hello

  def hello
    "#{hello_original}じゃなくて、#{@name}さん今日わ"
  end
end

# irb(main):043:0> user.hello
# => "Hello, Aliceじゃなくて、Aliceさん今日わ"

# オープンクラスやモンキーパッチのへいがい
# Rubyに最初から実装されているメソッドを不適切に上書きした
# RUbyの標準クラスの独自メソッド誰が定義したの？ってなる
# 外bライブラリのコードにモンキーパッチしたせいでバージョンが上がって予期せぬタイミングでエラーが起きた
# 頼らずに要件を満たすコードが書けないか
# 自分の変更を取り込んでもらえないか確認する
# 大いなる力には大いなる責任が伴うことを忘れてはならない

# 特異メソッド
# オープンクラスやモンキーパッチによって既存クラスを拡張したり挙動変更したりできるとした
# クラスではなくオブジェクト単位で挙動が変えられる
alice = 'I am Alice'
bob = 'I am bob'

def alice.shuffle
  chars.shuddle.join
end

alice.shuffle
bob.shuffle

# オブジェクト.メソッドで定義できる
# Aliceというおぶじぇくとに紐づくメソッド
# 数内やシンボルだけはRubyの実装場の制約により
# 特異メソッドを定義できません、Symbol

n = 1
def n.foo
  'foo'
end
# TypeError (can't define singleton)
sym = :alice
def sym.bar
  'bar'
end
#TypeError (can't define singleton)

alice = 'I am Alice'
class << alice
  def shuffle
    chars.shuffle.join
  end
end

## クラスメソッドは特異メソッドのいっしゅ
# あるメソッドとはクラスメソッドのこと
# クラスメソッドを定義するコード例
class User
  def self.hello
    'Hello'
  end

  class << self
    def hi
      'Hi.'
    end
  end
end

#　トクイメソッドを定義するコード
alice = 'I am alice.'

def alice.hello
  'Hello.'
end

class << alice
  def hi
    'Hi.'
  end
end

irb(main):014:0> alice = 'I am alice.'
=> "I am alice."

# クラスメソッドは以下のようなコードで定義することもできる
class User
end

def User.hello
  'Hello.'
end

class << User
  def hi
    'Hi.'
  end
end

User.hello
User.hi

# irb(main):014:0> User.hello
# => "Hello."
# irb(main):015:0> User.hi
# => "Hi."

## 中小クラスやインターフェースといった機能はない
# Rubymはコードを実行する循環にそのメソッドがよびだせるかどうか
# おぬジェクトのクラスは何かではない

def display_name(object)
  puts "Name is <<#{object.name}"
end

class User
  def name
    'Alice'
  end
end

class Product
  def name
    'A great movie'
  end
end

user = User.new
display_name(user)

product = Product.new
display_name(product)

# オブジェクトのクラスが何であれ王とメソッドが呼び出せればいいダックタイピング
# アヒルのように泣き、アヒルのようになくならそれはアヒルである

class Product
  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう
    stock = stock? ? 'あり' : 'なし'
    "商品名：#{@name} 価格:#{@price} 在庫:#{@stock}"
  end
end

#display_textメソッドに注目ありなしを表示
# 商品によって確認が異なるので各区サブクラスで必ずstock?メソッドを実装

class DVD < Product
  # 在庫があればtrueを返す
  def stock?
    true
  end
end

product = Product.new('A great film', 1000)
product.display_text
#スーパークラスにはないから NoMethodError (undefined method `stock?' for #<Product:0x00007fb1850c36e8 @name="A great film", @price=1000>)

dvd = DVD.new('A great film', 1000)
dvd.display_text
# irb(main):042:0> dvd.display_text
# => "商品名：A great film 価格:1000 在庫:"

# Productクラスでは失敗したが表面上はどちらも普通のクラス定義
# Productクラスが抽象クラス具象クラスだと見分ける構文はない
# Rubyはあくまでstock?メソッドが呼び出せるかどうか
# 何も知らない人はびびる

class Product
  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう
    stock = stock? ? 'あり' : 'なし'
    "商品名：#{@name} 価格:#{@price} 在庫:#{@stock}"
  end

  def stock?
    raise 'Must implement stock? in subclass'
  end
end

#display_textメソッドに注目ありなしを表示
# 商品によって確認が異なるので各区サブクラスで必ずstock?メソッドを実装

class DVD < Product
  # 在庫があればtrueを返す
  def stock?
    true
  end
end

product = Product.new('A great film', 1000)
product.display_text
#スーパークラスにはないから NoMethodError (undefined method `stock?' for #<Product:0x00007fb1850c36e8 @name="A great film", @price=1000>)

dvd = DVD.new('A great film', 1000)
dvd.display_text
# irb(main):042:0> dvd.display_text
# => "商品名：A great film 価格:1000 在庫:"

# Productクラスでは失敗したが表面上はどちらも普通のクラス定義
# Productクラスが抽象クラス具象クラスだと見分ける構文はない
# Rubyはあくまでstock?メソッドが呼び出せるかどうか
# 何も知らない人はびびる エラーを返すのを表示したりする

# => :stock?
# irb(main):059:0> product = Product.new('A great film', 1000)
# => #<Product:0x00007fb1858a13d8 @name="A great film", @price=1000>
# irb(main):060:0> product.display_text
# Traceback (most recent call last):
#         6: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         3: from (irb):60
#         2: from (irb):51:in `display_text'
#         1: from (irb):56:in `stock?'
# RuntimeError (Must implement stock? in subclass)

# 動的型付け言語は事前に実行可能なコードがどうかを検証しないため当然案がら実行して初めてエラーに遭遇する
# 柔軟にかける

# メソッドの有無を調べるrespond_do?

s = 'Alice'

# Stringクラスはsplitをmotu
# おぬジェクトに対して特定メソッドが呼び出し可能か確認する場合はrespons_to?を使います
s.respond_to?(:split)
s.respond_to?(:name)

# irb(main):065:0> s.respond_to?(:split)
# => true
# irb(main):066:0> s.respond_to?(:name)
# => false

# respond_to?メソッドを使えば条件分岐させることができる
def display_name(object)
  if object.respond_to?(:name)
    puts "Name is <<#{object.name}>>"
  else
    puts 'No name.'
  end
end

# メソッドを呼び出すたびにrespond_toでめそっど存在角にはしていてはパフォーマンスが悪い雨、様々は可能性がある場合はrespond_toメソッドが役に立つ

# Rubyでメソッドのオーバーロード
# 静的片付けではメソッドのオーバーロード多重定義という機能があります。
# 引数のデータ型や個数の違いにおいじで同じ名前の複数定義できる。
# オーバーロードはない
# メソッドが数値だけでなく文字列もnil一数として受け取れるようにしたい
# is_a?でチェックしたり、明示的にto_iで数値にする

def add_ten(n)
  n.to_i + 10
end

add_ten(1)

add_ten('2')
add_ten(nil)
# 引数のデフォルト値や可変長引数を使うことで柔軟に引数を帰れる
def add_numbers(a = 0, b = 0)
  a + b
end

add_numbers
add_numbers(1)
add_numbers(1, 2)