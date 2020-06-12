class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def hello
    "hello, I am #{name}"
  end

  def hi
    "Hi, I am #{self.name}"
  end

  def my_name
    "My name is #{name}"
  end
end

user = User.new('Alice')
user.hello
user.hi
user.my_name

# irb(main):019:0> user = User.new('Alice')
# => #<User:0x00007f8d65828eb8 @name="Alice">
# irb(main):020:0> user.hello
# => "hello, I am Alice"
# irb(main):021:0> user.hi
# => "Hi, I am Alice"
# irb(main):022:0> user.my_name
# => "My name is Alice"

class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def rename_to_bob
    name = 'Bob'
  end

  def rename_to_carol
    self.name = 'Carol'
  end

  def rename_to_dave
    @name = 'Dave'
  end

end

user = User.new('Alice')

user.rename_to_bob
user.name

user.rename_to_carol
user.name

user.rename_to_dave
user.name

# irb(main):024:0> user.rename_to_bob
# => "Bob"
# irb(main):025:0> user.name
# => "Alice"
# irb(main):026:0>
# irb(main):027:0> user.rename_to_carol
# => "Carol"
# irb(main):028:0> user.name
# => "Carol"
# irb(main):029:0>
# irb(main):030:0> user.rename_to_dave
# => "Dave"
# irb(main):031:0> user.name
# # => "Dave"

class Foo
  # 注：このputsはクラス定義mの読み込み時に呼び出される
  puts "クラス公文の直下のself: #{self}"

  def self.bar
    puts "クラスメソっど内のself: #{self}"
  end

  def baz
    puts "インスタンスメソどないのself: #{self}"
  end
end

Foo.bar

foo = Foo.new
foo.baz

# irb(main):046:0> Foo.bar
# クラスメソっど内のself: Foo
# => nil
# irb(main):047:0>
# irb(main):048:0> foo = Foo.new
# => #<Foo:0x00007fa1ae998610>
# irb(main):049:0> foo.baz
# インスタンスメソどないのself: #<Foo:0x00007fa1ae998610>
# => nil

class Foo
  def self.bar
    self.baz
  end

  def baz
    self.bar
  end
end

Foo.bar

foo = Foo.new
foo.baz

# irb(main):025:0> Foo.bar
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):25
#         1: from (irb):18:in `bar'
# NoMethodError (undefined method `baz' for Foo:Class)
# Did you mean?  bar
# irb(main):026:0>
# irb(main):027:0> foo = Foo.new
# => #<Foo:0x00007f92249296a0>
# irb(main):028:0> foo.baz
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):28
#         1: from (irb):22:in `baz'
# NoMethodError (undefined method `bar' for #<Foo:0x00007f92249296a0>)
# Did you mean?  baz
# irb(main):029:0>

class Foo
  # この時点ではクラスメソっどbarが定義されていないので呼び出せない
  #　self.bar
  #
  def self.bar
    puts "hello"
  end

  # クラス公文直下でクラスメソッド
  # クラスメソッドbarが定義されたあとなので呼び出せる
    self.bar
end

# hello
# => nil

class Foo
  3.times do
    puts "hello"
  end
end

# hello
# hello
# hello
# => 3

### クラスめい.メソッド

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するメソッド
  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    formatted_price = Product.format_price(price)
    #formatted_price = self.class.format_price(price)

    "name: #{name} ,price: #{formatted_price}"
  end
end

product =  Product.new('A great movie', 1000)
product.to_s
product.format_price(price)

# => :to_s
# irb(main):023:0>
# irb(main):024:0> product = Product.new('A great movie', 1000)
# => #<Product:0x00007f9b2689df78 @name="A great movie", @price=1000>
# irb(main):025:0> product.to_s
# => "name: A great movie ,price: 1000円"
# irb(main):026:0>