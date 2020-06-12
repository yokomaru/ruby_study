## クラス名::定数
class Product
   DEFAULT_PRICE = 0
end

Product::DEFAULT_PRICE

# irb(main):005:0> Product::DEFAULT_PRICE
# => 0

class Product
  DEFAULT_PRICE = 0
  private_constant :DEFAULT_PRICE
end

Product::DEFAULT_PRICE

# irb(main):011:0> Product::DEFAULT_PRICE
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):11
# NameError (private constant Product::DEFAULT_PRICE referenced)

class Product
  def foo
    # 定数はメソッド内では作れない
  DEFAULT_PRICE = 0
  end
end

##　再代入できる
class Product
  DEFAULT_PRICE = 0
  DEFAULT_PRICE = 1000
end

Product::DEFAULT_PRICE

Product::DEFAULT_PRICE = 3000

Product::DEFAULT_PRICE

# (irb):3: warning: already initialized constant Product::DEFAULT_PRICE
# (irb):2: warning: previous definition of DEFAULT_PRICE was here
# => 1000
# irb(main):005:0>
# irb(main):006:0> Product::DEFAULT_PRICE
# => 1000
# irb(main):007:0>
# irb(main):008:0> Product::DEFAULT_PRICE = 3000
# (irb):8: warning: already initialized constant Product::DEFAULT_PRICE
# (irb):3: warning: previous definition of DEFAULT_PRICE was here
# => 3000
# irb(main):009:0>
# irb(main):010:0> Product::DEFAULT_PRICE
# => 3000

Product.freeze

Product::DEFAULT_PRICE = 5000
# irb(main):011:0>
# irb(main):012:0> Product.freeze
# => Product
# irb(main):013:0>
# irb(main):014:0> Product::DEFAULT_PRICE = 5000
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):14
# FrozenError (can't modify frozen #<Class:Product>)
# irb(main):015:0>
## メソッド定義もできなくjなるよfreeze


class Product
  DEFAULT_PRICE = 0
  freeze
  DEFAULT_PRICE = 1000
  # FrozenError (can't modify frozen #<Class:Product>)
end

## 定数はミュータブルなオブジェクトに注意する
class Product
  NAME = 'A product'
  SOME_NAMES = ['Foo', 'Bar', 'Baz']
  SOME_PRICE ={'Foo' => 1000, 'Bar' => 2000, 'Baz' => 3000}
end

Product::NAME.upcase!
Product::NAME

Product::SOME_NAMES << 'Hoge'
Product::SOME_NAMES

Product::SOME_PRICE['Hoge'] = 4000
Product::SOME_PRICE

# irb(main):041:0> Product::NAME.upcase!
# => "A PRODUCT"
# irb(main):042:0> Product::NAME
# => "A PRODUCT"
# irb(main):043:0>
# irb(main):044:0> Product::SOME_NAMES << 'Hoge'
# => ["Foo", "Bar", "Baz", "Hoge"]
# irb(main):045:0> Product::SOME_NAMES
# => ["Foo", "Bar", "Baz", "Hoge"]
# irb(main):046:0>
# irb(main):047:0> Product::SOME_PRICE['Hoge'] = 4000
# => 4000
# irb(main):048:0> Product::SOME_PRICE
# => {"Foo"=>1000, "Bar"=>2000, "Baz"=>3000, "Hoge"=>4000}

class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz']

  def self.names_without_foo(names = SOME_NAMES)
    names.delete('Foo')
    names
  end
end

Product.names_without_foo
Product::SOME_NAMES
# irb(main):021:0> Product.names_without_foo
# => ["Bar", "Baz"]
# irb(main):022:0> Product::SOME_NAMES
# => ["Bar", "Baz"]

class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze
end

Product::SOME_NAMES[0].upcase!
Product::SOME_NAMES[0]

# => ["Foo", "Bar", "Baz"]
# irb(main):012:0>
# irb(main):013:0> Product::SOME_NAMES[0].upcase!
# => "FOO"
# irb(main):014:0> Product::SOME_NAMES[0]
# => "FOO"

class Product
  SOME_NAMES = ['Foo'.freeze, 'Bar'.freeze, 'Baz'.freeze]
end

Product::SOME_NAMES[0].upcase!
# FrozenError (can't modify frozen String)

class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].map(&:freeze).freeze
end

Product::SOME_NAMES[0].upcase!
# FrozenError (can't modify froz

class Product
  SOME_VALUES = 0
  SOME_TYPE = :foo
  SOME_FLAG = true
end

##　様々な種類の変数
### クラスインスタンス変数
### クラス直下とクラスメソッド内部
class Product
  # クラスインスタンス変数
  @name = 'Product'

  def self.name
  # クラスインスタンス変数
  @name
  end

  def initialize(name)
  # インスタンス変数
    @name = name
  end

  def name
  # クラスインスタンス変数
    @name
  end
end

Product.name

product = Product.new('A great foo')
product.name
Product.name

# irb(main):047:0> Product.name
# => "Product"
# irb(main):048:0> product = Product.new('A great foo')
# => #<Product:0x00007fa58001ce08 @name=nil>
# irb(main):041:0> product.name
# => "A great foo"
# irb(main):050:0> Product.name
# => "Product"
# irb(main):051:0>

class Product
  # クラスインスタンス変数
  @name = 'Product'

  def self.name
  # クラスインスタンス変数
  @name
  end

  def initialize(name)
  # インスタンス変数
    @name = name
  end

  def name
  # インスタンス変数
    @name
  end
end

class DVD < Product
  # クラスインスタンス変数
  @name = 'DVD'

  def self.name
  # クラスインスタンス変数
  @name
  end

  def upcase_name
  # インスタンス変数
    @name.upcase
  end
end


Product.name
DVD.name

product = Product.new('A great foo')
product.name

dvd = DVD.new('An Awesome film')
dvd.name
dvd.upcase_name

Product.name
DVD.name

# irb(main):037:0> Product.name
# => "Product"
# irb(main):038:0> DVD.name
# => "DVD"
# irb(main):039:0>
# irb(main):040:0> product = Product.new('A great foo')
# => #<Product:0x00007faf04030ec0 @name="A great foo">
# irb(main):041:0> product.name
# => "A great foo"
# irb(main):042:0>
# irb(main):043:0> dvd = DVD.new('An Awesome film')
# => #<DVD:0x00007faf04058100 @name="An Awesome film">
# irb(main):044:0> dvd.name
# => "An Awesome film"
# irb(main):048:0> dvd.upcase_name
# => "AN AWESOME FILM"
# irb(main):045:0>
# irb(main):046:0> Product.name
# => "Product"
# irb(main):047:0> DVD.name
# => "DVD"
# irb(main)

# クラス変数
## クラスメソッド内でもインスタンスメソッドでもなおかつスーパークラスとサブクラスでも共有される
## @@some_value


class Product
  # クラスインスタンス変数
  @@name = 'Product'

  def self.name
  # クラスインスタンス変数
    @@name
  end

  def initialize(name)
  # インスタンス変数
    @@name = name
  end

  def name
  # インスタンス変数
    @@name
  end
end

class DVD < Product
  # クラスインスタンス変数
  @@name = 'DVD'

  def self.name
  # クラスインスタンス変数
  @@name
  end

  def upcase_name
  # インスタンス変数
    @@name.upcase
  end
end

## DVDテイギシタタイミングデDVDになる
Product.name
DVD.name

product = Product.new('A great foo')
product.name

##newのタイミングでgreatmovieになる
Product.name
DVD.name

dvd = DVD.new('An Awesome film')
dvd.name
dvd.upcase_name
##newのタイミングでAn Awesome film'になる
product.name
Product.name
DVD.name

# irb(main):090:0> Product.name
# => "DVD"
# irb(main):091:0> DVD.name
# => "DVD"
# irb(main):092:0>
# irb(main):093:0> product = Product.new('A great foo')
# => #<Product:0x00007f8022915a10>
# irb(main):094:0> product.name
# => "A great foo"
# irb(main):095:0>
# irb(main):096:0> Product.name
# => "A great foo"
# irb(main):097:0> DVD.name
# => "A great foo"
# irb(main):098:0>
# irb(main):099:0> dvd = DVD.new('An Awesome film')
# => #<DVD:0x00007f8022936ad0>
# irb(main):100:0> dvd.name
# => "An Awesome film"
# irb(main):101:0> dvd.upcase_name
# => "AN AWESOME FILM"
# irb(main):102:0>
# irb(main):103:0> product.name
# => "An Awesome film"
# irb(main):104:0> Product.name
# => "An Awesome film"
# irb(main):105:0> DVD.name
# => "An Awesome film"

##グローバル変数と組込変数
$program_name = 'Awesome program'
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

Program.name
program = Program.new('Super program')
program.name
Program.name
$program_name

# irb(main):016:0> Program.name
# => "Awesome program"
# irb(main):017:0> program = Program.new('Super program')
# => #<Program:0x00007fd00b8ea750>
# irb(main):018:0> program.name
# => "Super program"
# irb(main):019:0> Program.name
# => "Super program"
# irb(main):020:0> $program_name
# => "Super program"

#クラス定義や言語仕様移管する高度な話題
s = 'Hello'
s.length
s.size
# alias 新しい　元の名前
class User
  def hello
    'Hello!'
  end

  alias greeting hello
end

user = User.new
user.hello
user.greeting

# irb(main):040:0> user.hello
# => "Hello!"
# irb(main):041:0> user.greeting
# => "Hello!"

class User
  undef freeze
end

user = User.new
user.freeze
# NoMethodError (undefined method `freeze' for #<User:0x00007fd00f825f50>)

##ネストしたクラスの定義
# class 外部
#   class 内部
#   end
# end

class User
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end


blood_type = User::BloodType.new('B')
blood_type.type

# irb(main):059:0> blood_type = User::BloodType.new('B')
# => #<User::BloodType:0x00007fd00f87e470 @type="B">
# irb(main):060:0> blood_type.type
# => "B"

## 演算子の挙動を独自に再定義する
class User
  def name=(value)
    @name = value
  end
end

user = User.new
user.name = 'Alice'

# irb(main):067:0> user = User.new
# => #<User:0x00007fd00f8a6ec0>
# irb(main):068:0> user.name = 'Alice'
# => "Alice"

## 演算子の挙動を独自に再定義する
class Product
  attr_reader :code, :name
  def initialize(code, name)
    @code = code
    @name = name
  end
end

 a = Product.new('A-0001', 'A great movie')
 b = Product.new('B-0001', 'An Awesomw film')
 c = Product.new('A-0001', 'A great movie')

 a == b
 a == c
 a == a

## 演算子の挙動を独自に再定義する
class Product
  attr_reader :code, :name
  def initialize(code, name)
    @code = code
    @name = name
  end

  def ==(other)
    if other.is_a?(Product)
      code == other.code
    else
      false
    end
  end
end

a = Product.new('A-0001', 'A great movie')
b = Product.new('B-0001', 'An Awesomw film')
c = Product.new('A-0001', 'A great movie')

a == b
a == c
a == a
a == 1
a == 'a'
# irb(main):017:0> a = Product.new('A-0001', 'A great movie')
# => #<Product:0x00007fa94c8277e0 @code="A-0001", @name="A great movie">
# irb(main):018:0> b = Product.new('B-0001', 'An Awesomw film')
# => #<Product:0x00007fa94e0228e0 @code="B-0001", @name="An Awesomw film">
# irb(main):019:0> c = Product.new('A-0001', 'A great movie')
# => #<Product:0x00007fa94e042528 @code="A-0001", @name="A great movie">
# irb(main):020:0>
# irb(main):021:0> a == b
# => false
# irb(main):022:0> a == c
# => true
# irb(main):024:0> a == 1
# => false
# irb(main):025:0> a == 'a'
# => false

a.==(b)
a.==(c)
1 == a

# irb(main):026:0> a.==(b)
# => false
# irb(main):027:0> a.==(c)
# => true
# irb(main):028:0> 1 == a
# => false

# ==の話が出てきたので誠意rする
#== はいろいろある
# equal?
# ==
# eql?
# ===

##　再定義できる

## equal?
a = 'abc'
b = 'abc'
a.equal?(b)

c = a
a.equal?(c)

# irb(main):030:0> a = 'abc'
# => "abc"
# irb(main):031:0> b = 'abc'
# => "abc"
# irb(main):032:0> a.equal?(b)
# => false
# irb(main):033:0>
# irb(main):034:0> c = a
# => "abc"
# irb(main):035:0> a.equal?(c)
# => true

## ==
## 1 == 1.0がtrue
1 == 1.0

## eql?
### ハッシュのキーとして2つのオブジェクトが等しいかどうかを判断する
### ハッシュ場では1to1.0は別々になる
h =  {1 => 'Integer', 1.0 => 'Float'}
h[1]
h[1.0]

1.eql?(1.0)

a = 'japan'
b = 'japan'

a.eql?(b)
a.hash
b.hash
c = 1
d = 1.0

c.eql?(d)
c.hash
d.hash

# irb(main):014:0> h =  {1 => 'Integer', 1.0 => 'Float'}
# => {1=>"Integer", 1.0=>"Float"}
# irb(main):015:0> h[1]
# => "Integer"
# irb(main):016:0> h[1.0]
# => "Float"
# irb(main):017:0>
# irb(main):018:0> 1.eql?(1.0)
# => false
# irb(main):019:0>
# irb(main):020:0> a = 'japan'
# => "japan"
# irb(main):021:0> b = 'japan'
# => "japan"
# irb(main):022:0>
# irb(main):023:0> a.eql?(b)
# => true
# irb(main):024:0> a.hash
# => 3616452632996653611
# irb(main):025:0> b.hash
# => 3616452632996653611
# irb(main):026:0> c = 1
# => 1
# irb(main):027:0> d = 1.0
# => 1.0
# irb(main):028:0>
# irb(main):029:0> c.eql?(d)
# => false
# irb(main):030:0> c.hash
# => -2879513091526162438
# irb(main):031:0> d.hash
# => -2612966429931631

### ===
text = '03-1234-5678'
case text
when /^\d{3}-\d{4}$/
  puts "郵便番号"
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts "日付"
when /^\d+-\d+-\d+$/
  puts "電話"
end
#＝＞電話

# when久野オブ=== caseのオブ

value = [1, 2, 3]
case value
when String
  puts "文字列"
when Array
  puts "あれー"
when Hash
  puts "ハッシュ"
end

