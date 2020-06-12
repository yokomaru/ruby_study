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
