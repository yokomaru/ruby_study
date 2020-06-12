class User
end

user = User.new
user.to_s
user.nil?

# irb(main):004:0> user = User.new
# => #<User:0x00007f932987e240>
# irb(main):005:0> user.to_s
# => "#<User:0x00007f932987e240>"
# irb(main):006:0> user.nil?
# => false
User.superclass

# irb(main):007:0> User.superclass
# => Object

user = User.new
user.methods.sort

# irb(main):011:0> user = User.new
# => #<User:0x00007f93298a4ee0>
# irb(main):012:0> user.methods.sort
# => [:!, :!=, :!~, :<=>, :==, :===, :=~, :__id__, :__send__, :class, :clone, :define_singleton_method, :display, :dup, :enum_for, :eql?, :equal?, :extend, :freeze, :frozen?, :hash, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :is_a?, :itself, :kind_of?, :method, :methods, :nil?, :object_id, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :remove_instance_variable, :respond_to?, :send, :singleton_class, :singleton_method, :singleton_methods, :taint, :tainted?, :tap, :then, :to_enum, :to_s, :trust, :untaint, :untrust, :untrusted?, :yield_self]

user.class
=> User

user.instance_of?(User)
user.instance_of?(String)

# irb(main):014:0> user.instance_of?(User)
# => true
# irb(main):015:0> user.instance_of?(String)
# => false

user.is_a?(User)
user.is_a?(Object)
user.is_a?(BasicObject)
user.is_a?(String)

# irb(main):016:0> user.is_a?(User)
# => true
# irb(main):017:0> user.is_a?(Object)
# => true
# irb(main):018:0> user.is_a?(BasicObject)
# => true
# irb(main):019:0> user.is_a?(String)
# => false
class Product
end

# class サブクラス < スーパークラス
# end

class DVD < Product
end

## superでスーパークラスのメソっどを呼び出す

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

product = Product.new('a great movie', 1000)
product.name
product.price

# irb(main):036:0> product.name
# => "a great movie"
# irb(main):037:0> product.price
# => 1000

class DVD < Product
  attr_reader :running_time

  def initialize(name, price,running_time)
    @name = name
    @price = price
    @running_time = running_time
  end
end

dvd = DVD.new('a great movie', 1000, 120)
dvd.name
dvd.price
dvd.running_time

# irb(main):048:0> dvd = DVD.new('a great movie', 1000, 120)
# => #<DVD:0x00007fb8cb912ba8 @name="a great movie", @price=1000, @running_time=120>
# irb(main):049:0> dvd.name
# => "a great movie"
# irb(main):050:0> dvd.price
# => 1000
# irb(main):051:0> dvd.running_time
# => 120
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end
end

dvd = DVD.new('a great movie', 1000, 120)
dvd.name
dvd.price
dvd.running_time

# irb(main):019:0> dvd = DVD.new('a great movie', 1000, 120)
# => #<DVD:0x00007fe8b0823b88 @name="a great movie", @price=1000, @running_time=120>
# irb(main):020:0> dvd.name
# => "a great movie"
# irb(main):021:0> dvd.price
# => 1000

### 引数が同じだったらそのまま
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class DVD < Product
  def initialize(name, price)
    super
  end
end

dvd = DVD.new('a great movie', 1000)
dvd.name
dvd.price

# irb(main):033:0> dvd = DVD.new('a great movie', 1000)
# => #<DVD:0x00007faac50e1470 @name="a great movie", @price=1000>
# irb(main):034:0> dvd.name
# => "a great movie"
# irb(main):035:0> dvd.price
# => 1000

#super()だと引数なしでスーパークラスのメソっどぉ呼び出す


class DVD < Product
  def initialize(name, price)
    super()
  end
end

dvd = DVD.new('a great movie', 1000)
#ArgumentError (wrong number of arguments (given 0, expected 2))#

# 一緒なら中書く必要ない
class DVD < Product
end

dvd = DVD.new('a great movie', 1000)

### メソッドのオーバーライド
# サブクラスではスーパークラスと同名のメソッドを定義することで上書きできる
# initializeメソッドもいっしゅ
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name} price:#{:price}"
  end

end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  # def to_s
  #   "name: #{name} price:#{price} running_time:#{running_time}"
  # end

  def to_s
    "#{super} ,running_time:#{running_time}"
  end
end

product = Product.new('a great movie', 1000)
product.to_s

dvd = DVD.new('a great movie', 1000, 120)
dvd.to_s

# irb(main):049:0> product = Product.new('a great movie', 1000)
# => #<Product:0x00007fc9ba9007f0 @name="a great movie", @price=1000>
# irb(main):050:0> product.to_s
# => "#<Product:0x00007fc9ba9007f0>"
# irb(main):051:0>
# irb(main):052:0> dvd = DVD.new('a great movie', 1000, 120)
# => #<DVD:0x00007fc9ba923f70 @name="a great movie", @price=1000, @running_time=120>
# irb(main):053:0> dvd.to_s
# => "#<DVD:0x00007fc9ba923f70>"

# irb(main):024:0> product = Product.new('a great movie', 1000)
# => #<Product:0x00007ff5ce87cc80 @name="a great movie", @price=1000>
# irb(main):025:0> product.to_s
# => "name: a great movie price:price"
# irb(main):026:0>
# irb(main):027:0> dvd = DVD.new('a great movie', 1000, 120)
# => #<DVD:0x00007ff5d20521c8 @name="a great movie", @price=1000, @running_time=120>
# irb(main):028:0> dvd.to_s
# => "name: a great movie price:price"

# irb(main):042:0> product = Product.new('a great movie', 1000)
# => #<Product:0x00007ff5ce8ed2c8 @name="a great movie", @price=1000>
# irb(main):043:0> product.to_s
# => "name: a great movie price:price"
# irb(main):044:0>
# irb(main):045:0> dvd = DVD.new('a great movie', 1000, 120)
# => #<DVD:0x00007ff5ce904ce8 @name="a great movie", @price=1000, @running_time=120>
# irb(main):046:0> dvd.to_s
# => "name: a great movie price:price running_time:120"

# irb(main):077:0>
# irb(main):078:0> product = Product.new('a great movie', 1000)
# => #<Product:0x00007ff5ce8af450 @name="a great movie", @price=1000>
# irb(main):079:0> product.to_s
# => "name: a great movie price:price"
# irb(main):080:0>
# irb(main):081:0> dvd = DVD.new('a great movie', 1000, 120)
# => #<DVD:0x00007ff5ce8bd550 @name="a great movie", @price=1000, @running_time=120>
# irb(main):082:0> dvd.to_s
# => "name: a great movie price:price ,running_time:120"

class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end

Foo.hello
Bar.hello
# irb(main):093:0> Foo.hello
# => "hello"
# irb(main):094:0> Bar.hello
# => "hello"

### メソッドの公開レベル
### public
### protected
### private

### public
class User
  def self.hello
    'hello'
  end
end

user = User.new
user.hello

### private
class User
  private
  def hello
    'hello'
  end
end

user = User.new
user.hello
# NoMethodError (private method `hello' called for #<User:0x00007fd29204ab48>)

# privateはレシーバを指定して呼び出すことがでいないメソッド
# privateでselfをダメ
# レシーバで呼んだことになるから
class User

  def hello
    "hello , #{self.name}"
  end

  private
  def name
    'ALice'
  end
end

user = User.new
user.hello
# NoMethodError (private method `name' called for #<User:0x00007fc63e921588>)

class User

  def hello
    "hello , #{name}"
  end

  private
  def name
    'ALice'
  end
end

user = User.new
user.hello

# irb(main):028:0> user = User.new
# => #<User:0x00007fc63e8e9750>
# irb(main):029:0> user.hello
# => "hello , ALice"

## privateはサブクラスでも呼び出せる

### 引数が同じだったらそのまま
class Product
  private

  def name
    'sss'
  end
end

class DVD < Product
  def to_s
    "name: #{name}"
  end
end

dvd = DVD.new
dvd.to_s

# irb(main):031:0>
# irb(main):032:0> dvd = DVD.new
# => #<DVD:0x00007f84b48e3088>
# irb(main):033:0> dvd.to_s
# => "name: sss"

### 引数が同じだったらそのまま
class Product
  def to_s
    "name: #{name}"
  end
  private

  def name
    'sss'
  end
end

class DVD < Product
  private

  def name
    'aaaaaa'
  end
end

dvd = DVD.new
dvd.to_s

# irb(main):020:0> dvd = DVD.new
# => #<DVD:0x00007fee2881b528>
# irb(main):021:0> dvd.to_s
# => "name: aaaaaa"

# スーパークラスの実装もしっかり把握してなければあかん

### クラスメソッドをprivateにしたい
class User
  private

  def self.hello
    'hello'
  end
end

# privateにならない
User.hello

### クラスメソッドをprivateにしたい
class User
  class << self
    private

    def self.hello
      'hello'
    end
  end
end

# privateにならない
User.hello
# NoMethodError (undefined method `hello' for User:Class)

# privateから先に定義する場合
# 普通にまとめる
class User
  private

  def foo
  end

  public

  def bar
  end
end

# 後からメソッドの公開レベルを変更する場合
class User
  def foo
    'foo'
  end

  def bar
    'bar'
  end

  private :foo, :bar

  def baz
    'baz'
  end
end

user = User.new
user.foo
user.bar
user.baz


#=> #<User:0x00007fc51a97aae0>
# irb(main):018:0> user.foo
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):18
# NoMethodError (private method `foo' called for #<User:0x00007fc51a97aae0>)
# Did you mean?  for
# irb(main):019:0> user.bar
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):19
#         1: from (irb):19:in `rescue in irb_binding'
# NoMethodError (private method `bar' called for #<User:0x00007fc51a97aae0>)
# irb(main):020:0> user.baz
# => "baz"
# irb(main):021:0>

# protectedメソッド
# protectedはそのメソッドを定義したクラス自信とサブクラスのインスタンスメソッドからレシーバ月で呼び出せる

class User
  # weightは外部に公開しない
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end
end
alice = User.new('Alice', 50)
bob = User.new('Bob', 65)
alice.heavier_than?(bob)

# irb(main):030:0> alice = User.new('Alice', 50)
# => #<User:0x00007f82919c5890 @name="Alice", @weight=50>
# irb(main):031:0> bob = User.new('Bob', 65)
# => #<User:0x00007f82919d7d60 @name="Bob", @weight=65>
# irb(main):032:0> alice.heavier_than?(bob)
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):32
#         1: from (irb):27:in `heavier_than?'
# NoMethodError (undefined method `weight' for #<User:0x00007f82919d7d60 @name="Bob", @weight=65>)

# 外部には後悔したくないけど同じクラスやサブクラスではればレシーバ月で呼び出せるようにしたい
# protected

class User
  # weightは外部に公開しない
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  def weight
    @weight
  end
end
alice = User.new('Alice', 50)
bob = User.new('Bob', 65)
alice.heavier_than?(bob)
bob.heavier_than?(alice)
alice.weight

# irb(main):025:0> alice = User.new('Alice', 50)
# => #<User:0x00007fc5c3886888 @name="Alice", @weight=50>
# irb(main):026:0> bob = User.new('Bob', 65)
# => #<User:0x00007fc5c38a5dc8 @name="Bob", @weight=65>
# irb(main):027:0> alice.heavier_than?(bob)
# => false
# irb(main):028:0> bob.heavier_than?(alice)
# => true
# irb(main):029:0> alice.weight
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):29
# NoMethodError (protected method `weight' called for #<User:0x00007fc5c3886888 @name="Alice", @weight=50>)
# irb(main):030:0>


class User
  # weightは外部に公開しない
  attr_reader :name, :weight
  protected :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end


end
alice = User.new('Alice', 50)
bob = User.new('Bob', 65)
alice.heavier_than?(bob)
bob.heavier_than?(alice)
alice.weight

# irb(main):033:0> alice = User.new('Alice', 50)
# => #<User:0x00007fcd1e9805b0 @name="Alice", @weight=50>
# irb(main):034:0> bob = User.new('Bob', 65)
# => #<User:0x00007fcd1e993a48 @name="Bob", @weight=65>
# irb(main):035:0> alice.heavier_than?(bob)
# => false
# irb(main):036:0> bob.heavier_than?(alice)
# => true
# irb(main):037:0> alice.weight
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):37
# NoMethodError (protected method `weight' called for #<User:0x00007fcd1e9805b0 @name="Alice", @weight=50>)

## 継承したら同名のインスタンス変数に注意
class Parent
  def initialize
    @first = 1
    @second = 2
    @third = 3
  end

  def number
    "#{@first}.#{@second}.#{@third}"
  end
end
class Child < Parent
  def initialize
    super
    @hour = 6
    @minutes = 30
    @second = 59
  end

  def time
    "#{@hour}.#{@minutes}.#{@second}"
  end
end

parent = Parent.new
parent.number

child = Child.new
child.time

child.number

# irb(main):062:0> parent = Parent.new
# => #<Parent:0x00007fcd210c1b88 @first=1, @second=2, @third=3>
# irb(main):063:0> parent.number
# => "1.2.3"
# irb(main):064:0>
# irb(main):065:0> child = Child.new
# => #<Child:0x00007fcd1e9393e0 @first=1, @second=59, @third=3, @hour=6, @minutes=30>
# irb(main):066:0> child.time
# => "6.30.59"
# irb(main):067:0>
# irb(main):068:0> child.number
# => "1.59.3"
# @secondが上書きされていた