# モジュールについて
# クラスのようでクラスえはに大規模なプログラムで使われる
#

class Team
  # 配列をfreezeして要素や追加の削除を禁止する
  COUNTRIES = ['Japan', 'US', 'India'].freeze
end

class Team
  # 中身もfreezeして要素や追加の削除を禁止する
  COUNTRIES = ['Japan'.freeze, 'US'.freeze, 'India'.freeze].freeze
end

# 毎回やるのは無理なので　で絵p＿fれえぇというメソッドを作成し全てfreexeできるようにする
# 　frozen？はtrue
# A>>?ブロックが全て帰った場合treu

# プログラムを複雑にしないように
# deep_freezeメソッドの引数は配列またはハッシュとする
# 引数は配列やハッシュはフラットなこうぞにする

# モジュールのようと
# 警鐘を使わずにクラスにインスタンスメソッドを追加する8(ミックスいん)
# 複数のクラスに対して共通の得意メソッドを追加する　ミックしん
# クラス名や定数名の衝突を防ぐために名前空間を作る
# 関数的メソッドを定義する
# シングルトンオブジェクトのように扱って設定値を保持する

# module モジュール名
#   # 定義
# end

module Greeter
  def hello
    'hello'
  end
end
# クラス定義ににているが違う
# モジュールからインスタンスを作成することはできない
# 他のモジュールやクラスを継承することはできない

# モジュールインスタンスは作成できない
greeter Greeter.new
# NoMethodError (undefined method `new' for Greeter:Module)
module AwesomeGreeter < Greeter
end
# SyntaxError ((irb):9: syntax error, unexpected '<')
# ....class; module AwesomeGreeter < Greeter

## モジュールミックしん(include extend)
# モジュールクラスにincludeする

# Rubyは単一継承
# is-aの関係にはなくても複数のクラスに同じような機能が必要になるケースは存在する
class Product
  def title
    log 'title is called'
    'A great movie'
  end

  private
  def log(text)
    # 本来であれば標準ライブラリ使うべきだけどputsでやる
    puts "[LOG] #{text}"
  end
end

class User
  def name
     log 'name is called.'
     'Alice'
  end

  private
  # このメソッドの実装はProductクラスのlogと全く同じ
  def log(text)
    # 本来であれば標準ライブラリ使うべきだけどputsでやる
    puts "[LOG] #{text}"
  end
end

product = Product.new
product.title

user = User.new
user.name

# irb(main):039:0> product = Product.new
# => #<Product:0x00007fc2428e0cb8>
# irb(main):040:0> product.title
# [LOG] title is called
# => "A great movie"

# irb(main):042:0> user = User.new
# => #<User:0x00007fc2428f1b80>
# irb(main):043:0> user.name
# [LOG] name is called.
# => "Alice"

#　継承は使えないがログを出力するという共通の機能をは持たせたい
#

# ログ手強く用のメソッドを提供する
# ログ出力できるおいう意味

module Loggable
  private
  def log(text)
    # 本来であれば標準ライブラリ使うべきだけどputsでやる
    puts "[LOG] #{text}"
  end
end

class Product
  include Loggable

  def title
    log 'title is called'
    'A great movie'
  end
end

class User
  include Loggable

  def name
     log 'name is called.'
     'Alice'
  end
end

product = Product.new
product.title

# user = User.new
# user.name
# irb(main):053:0> product = Product.new
# => #<Product:0x00007fe6600fd720>
# irb(main):054:0> product.title
# [LOG] title is called
# => "A great movie"
# irb(main):055:0>
# irb(main):056:0> user = User.new
# => #<User:0x00007fe66010dd00>
# irb(main):057:0> user.name
# [LOG] name is called.
# => "Alice"

# Loggableにモジュールをincludeすることでモジュールに定義したlogメソッドを呼び出せたincludeして呼び出すのミックスインという
product.log 'public?'

# LOG] public?
# => nil
# クラスの外から呼び出せちゃうからpricateにする

# モジュールをextendする
# 例題の作成

class Team
  COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
end

# 配列自信と配列の全要素がｆfreezeされている
Team::COUNTRIES.frozen?
Team::COUNTRIES.all?{|country| country.frozen?}

class Bank
  CURRENCIES = deep_freeze({'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee'})
end

Team::CURRENCIES.frozen?
Team::CURRENCIES.all?{|key, value| key.frozen? && value.frozen? }

## deep_freezeメソッドの引数は配列またはハッシュのみ
## フラットにする

module Loggable

end

class Product
  include Loggable
end

Product.include?(Loggable)
# irb(main):008:0> Product.include?(Loggable)
# => true

Product.included_modules

# irb(main):010:0> Product.included_modules
# => [Loggable, Kernel]

Product.ancestors

# irb(main):011:0> Product.ancestors
# => [Product, Loggable, Object, Kernel, BasicObject]

product = Product.new
product.class.include?(Loggable)
product.class.included_modules

# irb(main):012:0> product = Product.new
# => #<Product:0x00007f81f8179158>
# irb(main):013:0> product.class.include?(Loggable)
# => true
# irb(main):014:0> product.class.included_modules
# => [Loggable, Kernel]

product = Product.new
product.is_a?(Product)
product.is_a?(Loggable)
product.is_a?(Object)

# irb(main):015:0> product.is_a?(Product)
# => true
# irb(main):016:0> product.is_a?(Loggable)
# => true
# irb(main):017:0> product.is_a?(Object)
# => true

module Taggable
  def price_tag
    # priceメソッドはinclude先で定義されているはず
    # あえてselfをつけて呼び出してもいい(privateメソッドでなければ)
    # selfはinclude先のクラスのインスタンスになる
    "#{self.price}円"
  end
end

class Product
  include Taggable

  def price
    1000
  end
end

product = Product.new
product.price_tag

# irb(main):033:0> product = Product.new
# => #<Product:0x00007fd47d06e150>
# irb(main):034:0> product.price_tag
# => "1000円"

## Enumerable

Array.include?(Enumerable)
Hash.include?(Enumerable)
Range.include?(Enumerable)

# irb(main):035:0> Array.include?(Enumerable)
# => true
# irb(main):036:0> Hash.include?(Enumerable)
# => true
# irb(main):037:0> Range.include?(Enumerable)
# => true

[1, 2, 3].map {|n| n * 10}
{a: 1, b: 2, c: 3 }.map {|k, v| [k, v * 10]}
(1..3).map {|n| n * 10}

# irb(main):040:0> [1, 2, 3].map {|n| n * 10}
# => [10, 20, 30]
# irb(main):041:0> {a: 1, b: 2, c: 3 }.map {|k, v| [k, v * 10]}
# => [[:a, 10], [:b, 20], [:c, 30]]
# irb(main):042:0> (1..3).map {|n| n * 10}
# => [10, 20, 30]

[1, 2, 3].count
{a: 1, b: 2, c: 3 }.count
(1..3).count

# irb(main):044:0> [1, 2, 3].count
# => 3
# irb(main):045:0> {a: 1, b: 2, c: 3 }.count
# => 3
# irb(main):046:0> (1..3).count
# => 3

## Compareble
#  <=> UFO演算子
#
2 <=> 1
2 <=> 2
1 <=> 2
2 <=> 'abc'

'xyz' <=> 'abc'
'abc' <=> 'abc'
'abc' <=> 'xyz'
'xyz' <=> 123

# irb(main):047:0> 2 <=> 1
# => 1
# irb(main):048:0> 2 <=> 2
# => 0
# irb(main):049:0> 1 <=> 2
# => -1
# irb(main):050:0> 2 <=> 'abc'
# => nil

# irb(main):052:0> 'xyz' <=> 'abc'
# => 1
# irb(main):053:0> 'abc' <=> 'abc'
# => 0
# irb(main):054:0> 'abc' <=> 'xyz'
# => -1
# irb(main):055:0> 'xyz' <=> 123
# => nil

# 文字列や数値はCOmparableモジュールをincludeしているので大小関係を適切に判定する
2 > 1
2 <= 2
1 == 2

'abc' > 'xyz'
'abc' <= 'xyz'
'abc' == 'xyz'

# irb(main):057:0> 2 > 1
# => true
# irb(main):058:0> 2 <= 2
# => true
# irb(main):059:0> 1 == 2
# => false

# irb(main):061:0> 'abc' > 'xyz'
# => false
# irb(main):062:0> 'abc' <= 'xyz'
# => true
# irb(main):063:0> 'abc' == 'xyz'
# => false

# Comparableモジュールを独自のクラスにincludeして使える

class Tempo
  include Comparable

  attr_reader :bpm
  # bpmはBeats per miniteの略で音楽の速さを表す単位

  def initialize(bpm)
    @bpm = bpm
  end

  def <=>(other)
    if other.is_a?(Tempo)
      #bpm同士を<=>で比較した結果を返す
      bpm <=> other.bpm
    else
      # 比較できない場合はnilを返す
      nil
    end
  end

  def inspect
    "#{bpm}bpm"
  end
end

t_120 = Tempo.new(120)
t_180 = Tempo.new(180)

t_120 > t_180
t_120 <= t_180
t_120 == t_180


# irb(main):026:0> t_120 = Tempo.new(120)
# => 120bpm
# irb(main):027:0> t_180 = Tempo.new(180)
# => 180bpm
# irb(main):028:0>
# irb(main):029:0> t_120 > t_180
# => false
# irb(main):030:0> t_120 <= t_180
# => true
# irb(main):031:0> t_120 == t_180
# # => false

# # <=>はsortをするときにも使える
tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
tempos.sort

# irb(main):032:0> tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
# => [180bpm, 60bpm, 120bpm]
# irb(main):033:0> tempos.sort
# => [60bpm, 120bpm, 180bpm]

## Kernel
## Objectがkernelモジューるをincludeしているから
Object.include?(Kernel)
# irb(main):034:0> Object.include?(Kernel)
# => true

# ここはどこ？私は誰
class User
  p self
  p self.class
end

# irb(main):038:0> p self
# main
# => main
# irb(main):039:0> p self.class
# Object
# => Object
# クラス公文やモジュ０流構文に囲まれていない一番外側の部分御事をトップレベルという
# トップレベルにはmainというなのObjectクラスのインスタンスがselfとして芯材している
#つまり誰はObjectクラスのインスタンスになる

# irb(main):040:0> class User
# irb(main):041:1>   p self
# irb(main):042:1>   p self.class
# irb(main):043:1> end
# User
# Class

class User
end

# Userクラス自身のクラスはClassクラス
User.class
Class.superclass

module Loggable
end

Loggable.class

Module.superclass

# irb(main):019:0> User.class
# => Class
# irb(main):020:0> Class.superclass
# => Module
# irb(main):021:0>
# irb(main):022:0> module Loggable
# irb(main):023:1> end
# => nil
# irb(main):024:0>
# irb(main):025:0> Loggable.class
# => Module
# irb(main):026:0>
# irb(main):027:0> Module.superclass
# => Object

class User
  p self
  p self.class
end

module Loggable
  p self
  p self.class
end

# suzukiyouko@suzukiyukonoMBP cherry % irb
# irb(main):001:0> class User
# irb(main):002:1>   p self
# irb(main):003:1>   p self.class
# irb(main):004:1> end
# User
# Class
# => Class
# irb(main):005:0>
# irb(main):006:0> module Loggable
# irb(main):007:1>   p self
# irb(main):008:1>   p self.class
# irb(main):009:1> end
# Loggable
# Module
# => Module

# モジュールとインスタンス変数

module NameChanger
  def change_name
    # include先のクラスのインスタンス変数を変更する
    @name = 'アリス'
  end
end

class User
  include NameChanger

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
user.name

# モジュールで定義したメソッドでインスタンス変数を書き換える
user.change_name
user.name

# irb(main):019:0> user = User.new('alice')
# => #<User:0x00007f8bee8e5c98 @name="alice">
# irb(main):020:0> user.name
# => "alice"
# irb(main):021:0>
# irb(main):022:0> # モジュールで定義したメソッドでインスタンス変数を書き換える
# => nil
# irb(main):023:0> user.change_name
# => "アリス"
# irb(main):024:0> user.name
# => "アリス"

# モジュールとミックスイン先のインスタンスヘンス教諭するのはよくない

module NameChanger
  def change_name
    # セッターメソッド経由でデータ変更する
    self.name = 'アリス'
  end
end

class User
  include NameChanger

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
user.name

# モジュールで定義したメソッドでインスタンス変数を書き換える
user.change_name
user.name

# irb(main):018:0> user = User.new('alice')
# => #<User:0x00007fb5890463c0 @name="alice">
# irb(main):019:0> user.name
# => "alice"
# irb(main):020:0>
# irb(main):021:0> # モジュールで定義したメソッドでインスタンス変数を書き換える
# => nil
# irb(main):022:0> user.change_name
# => "アリス"
# irb(main):023:0> user.name
# => "アリス"

## オブジェクトに直接にミックしんする

module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

s = 'abc'
s.log('Hello.')
s.extend(Loggable)
s.log('Hello.')

# irb(main):050:0> s = 'abc'
# => "abc"
# irb(main):051:0> s.log('Hello.')
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):51
# NoMethodError (undefined method `log' for "abc":String)
# irb(main):052:0> s.extend(Loggable)
# => "abc"
# irb(main):053:0> s.log('Hello.')
# [LOG]Hello.

## モジュールを利用した名前空間の作成

class Second
  def initialize(player , uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end

class Second
  def initialize(digits)
    @digits = digits
  end
end

Second.new('Alice', 13)
Second.new(13)

# irb(main):029:0> Second.new('Alice', 13)
# Traceback (most recent call last):
#         6: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         3: from (irb):29
#         2: from (irb):29:in `new'
#         1: from (irb):24:in `initialize'
# ArgumentError (wrong number of arguments (given 2, expected 1))
# irb(main):030:0> Second.new(13)
# => #<Second:0x00007fe5e3117da0 @digits=13>

module Baseball
  class Second
    def initialize(player , uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
    end
  end
end

Baseball::Second.new('Alice', 13)
Clock::Second.new(13)

# irb(main):018:0> Baseball::Second.new('Alice', 13)
# => #<Baseball::Second:0x00007fa2f7896b28 @player="Alice", @uniform_number=13>
# irb(main):019:0> Clock::Second.new(13)
# => #<Clock::Second:0x00007fa2f782c840 @digits=13>

# 名前空間でぐらーぷやカテゴリを分ける

require "active_support/core_ext/string/conversions"

# ネストなしで名前空間つきのクラス定義する
module Baseball
end

# モジュール名::クラス名の形でクラスを定義できる
class Baseball::Second
  def initialize(player, uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end

class Second
  def initialize(player , uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
      @baseball_second = Second.new('Clock', 10)
    end
  end
end

Clock::Second.new(13)
#ArgumentError (wrong number of arguments (given 2, expected 1))

class Second
  def initialize(player , uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
      @baseball_second = ::Second.new('Clock', 10)
    end
  end
end

Clock::Second.new(13)
#irb(main):037:0> Clock::Second.new(13)
# トップレベルのsecondクラスお参照できる用意なります
# 定数参照の優先順位
#=> #<Clock::Second:0x00007fc2f48b5ce0 @digits=13, @baseball_second=#<Second:0x00007fc2f48b5c90 @player="Clock", @uniform_number=10>>

# 関数や定数を提供するモジュ０る
module Loggable
  # 得意メソッドといsてメソッドを定義する
  def self.log(text)
    puts "[LOG]#{text}"
  end
end

Loggable.log("Hello.")

# rb(main):014:0> Loggable.log("Hello.")
# [LOG]Hello.

module Loggable
  class << self
    def log(text)
      puts "[LOG]#{text}"
    end
  end
end

Loggable.log("Hello.")
# irb(main):024:0> Loggable.log("Hello.")
# [LOG]Hello.

# module_functionメソッド

module Loggable

  def log(text)
    puts "[LOG]#{text}"
  end

  module_function :log
end

Loggable.log('Hello.')
# Loggableモジュールをincludeしたクラスを定義する

class Product
  include Loggable
  # includeしたLoggableモジュールのlogを呼び出す
  def title
    log 'title is called'
    'A great movie'
  end
end
# ミックスインとしてlogメソッドを呼び出す
product = Product.new
product.title
=> :title
# irb(main):021:0> product = Product.new
# => #<Product:0x00007fa1a883c088>
# irb(main):022:0> product.title
# [LOG]title is called
# => "A great movie"

# module_functionめそっど引数なしで呼び出した場合は全てモジュール関数になる

module Loggable
  # 定数を定義する
  PREFIX = '[LOG]'.freeze

  def log(text)
    puts "[LOG]#{text}"
  end
end

# Loggable::PREFIX
# irb(main):032:0> Loggable::PREFIX
# => "[LOG]"

# モジュール関数や定数を持つモジュールれい
# 平方根を求めるやつ
Math.sqrt(2)

class Caluculater
  include Math

  def calc_sqrt(n)
    sqrt(n)
  end
end

caluculater = Caluculater.new
caluculater.calc_sqrt(2)

# irb(main):043:0> caluculater = Caluculater.new
# => #<Caluculater:0x00007fa1a80ce008>
# irb(main):044:0> caluculater.calc_sqrt(2)
# => 1.4142135623730951

# 自然対数の底
Math::E
# 円周率を表す
Math::PI

Kernel.puts "Hello."
Kernel.p [1, 2, 3]
# irb(main):045:0> Kernel.puts "Hello."
# Hello.
# => nil
# irb(main):046:0> Kernel.p [1, 2, 3]
# [1, 2, 3]
# => [1, 2, 3]

# 状態を保持するもモジュールの作成
module AwesomeApi
  # 設定を保持するクラスインスタンスの変数を用意する
  @base_url = ''
  @debug_mode = false

  class << self
    def base_url=(value)
      @base_url = value
    end

    def base_url
      @base_url
    end

    def debug_mode=(value)
      @debug_mode = value
    end

    def debug_mode
      @debug_mode
    end

    # 本当は下手できる
    # arrt_accessor :base_url, :debug_mode
  end
end

AwesomeApi.base_url = "http://ssss"
AwesomeApi.debug_mode = true
irb(main):074:0> AwesomeApi.base_url = "http://ssss"
=> "http://ssss"
irb(main):075:0> AwesomeApi.debug_mode = true
=> true
AwesomeApi.base_url
AwesomeApi.debug_mode
irb(main):076:0> AwesomeApi.base_url
=> "http://ssss"
irb(main):077:0> AwesomeApi.debug_mode
=> true

# クラスでも一緒だけど、インスタンスかする必要がないんだったらモジュールでいい
# 唯一一つだけを作る手法のことをシングルトンパターンという

# Singletonモジュールを使う

require 'singleton'
class Configuration
  # Singletonモジュールを使う
  include Singleton
  attr_accessor :base_url, :debug_mode

  def initialize
    # 初期値
    @base_url = ''
    @debug_mode = false
  end
end

# newdekinai
config = Configuration.new
#NoMethodError (private method `new' called for Configuration:Class)
config = Configuration.instance
config.base_url = "http//sss"
config.debug_mode = true
# irb(main):015:0> config.base_url
# => ""
# irb(main):016:0> config.debug_mode
# => false

other = Configuration.instance
other.base_url
other.debug_mode

# irb(main):028:0> other = Configuration.instance
# => #<Configuration:0x00007fc95505f458 @base_url="http//sss", @debug_mode=true>
# irb(main):029:0> other.base_url
# => "http//sss"
# irb(main):030:0> other.debug_mode
# => true

config.object_id
other.object_id
config.equal?(other)

# どちらも全く同じ
# irb(main):022:0> config.object_id
# => 70251345803820
# irb(main):023:0> other.object_id
# => 70251345803820
# irb(main):024:0> config.equal?(other)
# => true

# AwesomeAPi
# AwesomeAPiモジューる設定値は保持する
module AwesomeApi
  @base_url = ''
  @debug_mode = false

  class << self
    arrt_accessor :base_url, :debug_mode
  end
end

# こちらではAwesomeAPiモジュールが名前空間として使われる
module AwesomeApi
  class Engine
    arrt_accessor
  end
end

# メソッド探索
# どこに定義しているのか

module A
  def to_s
    "<A> #{super}"
  end
end

module B
  def to_s
    "<B> #{super}"
  end
end

class Product
  def to_s
    "<Product> #{super}"
  end
end

class DVD < Product
  include A
  include B

  def to_s
    "<DVD> #{super}"
  end
end

dvd = DVD.new
dvd.to_s
irb(main):061:0> dvd = DVD.new
=> #<DVD:0x00007fc9520478b0>
irb(main):062:0> dvd.to_s
=> "<DVD> <B> <A> <Product> #<DVD:0x00007fc9520478b0>"
DVD.ancestors
# irb(main):063:0> DVD.ancestors
# => [DVD, B, A, Product, Object, Kernel, BasicObject]

dvd.foo

#NoMethodError (undefined method `foo' for #<DVD:0x00007fc9520478b0>)

# モジュールに他のモジュールをインクルドする
module Greeting
  def hello
    'hello.'
  end
end

module Aisatsu
  include Greeting
  def konnnichiwa
    '今日わ。'
  end
end

class User
  include Aisatsu
end

user = User.new

# Aisatuモジュールのメソッドを呼び出す
user.konnnichiwa
# Greetingモジュールのメソッドを呼び出す
user.hello

# rb(main):019:0> user.konnnichiwa
# => "今日わ。"
# irb(main):020:0> user.hello
# => "hello."

user.ancestors
# rb(main):022:0> User.ancestors
# => [User, Aisatsu, Greeting, Object, Kernel, BasicObject]

# prependでモジュールミックしん
# prependは優先されｒまｓ

module A
  def to_s
    "<A> #{super}"
  end
end

class Product
  #prepend A
  include A

  def to_s
    "<Product> #{super}"
  end
end

product = Product.new
product.to_s

# irb(main):037:0> product = Product.new
# => #<Product:0x00007f9bcb05f988>
# irb(main):038:0> product.to_s
# => "<A> <Product> #<Product:0x00007f9bcb05f988>"

Product.ancestors
# irb(main):039:0> Product.ancestors
# => [A, Product, Object, Kernel, BasicObject]
# irb(main):016:0> Product.ancestors
# => [Product, A, Object, Kernel, BasicObject]

# prependで既存メソッドを置き換える
class Product
  def name
    "A great film"
  end
end

product = Product.new
product.name
=> "A great film"

class Product
  alias name_original name
  def name
    "<<#{name_original}>>"
  end
end

product.name
=> "<<A great film>>"


# 以下のProductクラスは外部ライブらしで設定されている
class Product
  def name
    "A great film"
  end
end

module NameDecorator
  def name
    # prependするとsuperはミックスインした先のクラスのnamewoyobidasu
    "<<#{super}>>"
  end
end

class Product
  prepend NameDecorator
end

product = Product.new
product.name

# エイリアスメソッドを使った場合と同じ結果が得られる
irb(main):020:0> product = Product.new
=> #<Product:0x00007fd75c89aea0>
irb(main):021:0> product.name
=> "<<A great film>>"

class User
  def name
    'Alice'
  end
end

class User
  prepend NameDecorator
end

user = User.new
user.name
# irb(main):032:0> user = User.new
# => #<User:0x00007fd75c8be008>
# irb(main):033:0> user.name
# => "<<Alice>>"
module StringShuffle
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end

# 通常はStringクラスにhsufflehはない
"Alixe".shuffle
#NoMethodError (undefined method `shuffle' for "Alixe":String)

class User
  # refinementeを有効か
  using StringShuffle

  def initialize(name)
    @name = name
  end

  def shuffled_name
    # Userクラスｎ内部であればStringのしゅっsぇ使える
    @name.shuffle
  end

  # user意外だとだめ
end

user = User.new("Alice")
user.shuffled_name
"Alice".shuffle

# irb(main):029:0> user = User.new("Alice")
# => #<User:0x00007fea7d902008 @name="Alice">
# irb(main):030:0> user.shuffled_name
# => "ceAil"
# irb(main):031:0> "Alice".shuffle
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):31
# NoMethodError (undefined method `shuffle' for "Alice":String)

module StringShuffle
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end
require './string_shuffle'
using StringShuffle

puts "Alice".shuffle

class User
  def initialize(name)
    @name = name
  end

  def shuffled_name
    # Userクラスｎ内部であればStringのしゅっsぇ使える
    @name.shuffle
  end
end

user = User.new("Alice")
puts user.shuffled_name
puts "Alice".shuffle

module SomeModule
  refine Object do

  end

  refine String do

  end
end

module SomeModule
  refine Enumerable do

  end
end

module Sample
  class User
    NAME = 'Alice'.freeze

    def self.hello(name = NAME)
      "Hello, I am #{name}"
    end
  end
end

Sample::User::NAME
Sample::User.hello

# irb(main):070:0> Sample::User::NAME
# => "Alice"
# irb(main):071:0> Sample::User.hello
# => "Hello, I am Alice"
Sample::User::hello
# irb(main):072:0> Sample::User::hello
# => "Hello, I am Alice"
s = 'abc'
s::upcase
# irb(main):073:0> s = 'abc'
# => "abc"
# irb(main):074:0> s::upcase
# => "ABC"

# Sample.User::NAME
# Sample::User.NAME
# irb(main):075:0> Sample.User::NAME
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):75
# NoMethodError (undefined method `User' for Sample:Module)
# Did you mean?  super
# irb(main):076:0> Sample::User.NAME
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):76
#         1: from (irb):76:in `rescue in irb_binding'
# NoMethodError (undefined method `NAME' for Sample::User:Class)
# irb(main):077:0>
# ドットは名前空間を区切ったり定数を参照したりするには使えない
# ドットの右側常にめそっどである
