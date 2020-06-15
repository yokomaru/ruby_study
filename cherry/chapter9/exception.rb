module Greeter
  def hello
    'hello'
  end
end

greeter = Greeter.new

# irb(main):007:0> greeter = Greeter.new
# Traceback (most recent call last):
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         2: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):7
# NoMethodError (undefined method `new' for Greeter:Module)

puts 'start'
module Greeter
  def hello
    'hello'
  end
end

greeter = Greeter.new
puts 'end'


def method_1
  puts 'method_1 start'
  begin
    method_2
  rescue
    puts 'method_1 エラー'
  end
  puts 'method_1 end'
end

def method_2
  puts 'method_2 start'
    method_3
  puts 'method_2　end'
end

def method_3
  puts 'method_3 start'
    1 / 0
  puts 'method_3　end'
end

# irb(main):077:0> method_1
# method_1 start
# method_2 start
# method_3 start
# method_1 エラー
# method_1 end
# => nil


begin
  1 / 0
rescue => e
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}"
  puts "バックトレース---"
  puts e.backtrace
  puts "-----"
end

# ラークラス: ZeroDivisionError
# エラーメッセージ: divided by 0
# バックトレース---
# (irb):79:in `/'
# (irb):79:in `irb_binding'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/workspace.rb:85:in `eval'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/workspace.rb:85:in `evaluate'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/context.rb:385:in `evaluate'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:493:in `block (2 levels) in eval_input'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:647:in `signal_status'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:490:in `block in eval_input'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/ruby-lex.rb:246:in `block (2 levels) in each_top_level_statement'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/ruby-lex.rb:232:in `loop'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/ruby-lex.rb:232:in `block in each_top_level_statement'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/ruby-lex.rb:231:in `catch'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb/ruby-lex.rb:231:in `each_top_level_statement'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:489:in `eval_input'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:428:in `block in run'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:427:in `catch'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:427:in `run'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/2.6.0/irb.rb:383:in `start'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
# /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
# -----
# => nil

# クラスの指定も可能
begin
  1/0
rescue ZeroDivisionError
  puts "０乗さん"
end

# irb(main):087:0> begin
#   irb(main):088:1>   1/0
#   irb(main):089:1> rescue ZeroDivisionError
#   irb(main):090:1>   puts "０乗さん"
#   irb(main):091:1> end
#   ０乗さん
#   => nil

begin
  1/0
rescue ZeroDivisionError
  puts "０乗さん"
rescue NoMethodError
  puts "のめそ"
end

begin
  1/0
rescue ZeroDivisionError、 NoMethodError　=> e
  puts "のめそか０"
  puts "#{e.class}#{e.message}"
end

begin
rescue
   # StanderdErrorとサブクラス
end

begin
rescue => e
     # クラス自信とサブクラス
end

# のめそ、ネーム、スタンダードエクセプション
begin
  'abc'.foo
rescue NameError
  puts "NameError"
rescue NoMethodError
  puts "NoMethodError"
end

# irb(main):098:1> end
# NameError
# => nil

# 例外処理を書く場合は例外クラスの景勝館けいを意識しておかないとあかん

# 例外処理をやり直す
retry_count = 0
begin
  puts "処理をかいし"
  1 / 0
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retryします(#{retry_count})"
    retry
  else
    puts "retryに失敗"
  end
end

# 処理をかいし
# retryします(1)
# 処理をかいし
# retryします(2)
# 処理をかいし
# retryします(3)
# 処理をかいし
# retryに失敗
# => nil

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 意図的に例外を発生
    raise "無効な国名です#{country}"
  end
end

currency_of(:japan)
currency_of(:italy)

# irb(main):138:0> currency_of(:japan)
# => "yen"
# irb(main):139:0> currency_of(:italy)
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):139
#         1: from (irb):134:in `currency_of'
# RuntimeError (無効な国名ですitaly)

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 意図的に例外を発生
    #raise ArgumentError, "無効な国名です#{country}"
    raise ArgumentError.new("無効な国名です#{country}")
  end
end

currency_of(:italy)

# irb(main):170:0> currency_of(:italy)
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):170
#         1: from (irb):166:in `currency_of'
# ArgumentError (無効な国名ですitaly)
# irb(main):171:0>

# 基本は使わない
# メール送る処理など
users.each do |user|
  begin
    send_mail_to(user)
  rescue => e
    puts "#{e.class}#{e.message}"
    puts e.backtrace
  end
end


# 例外処理の対象ハニと対象クラスを極呂絞り込む
# 平成の日付文字列をDate
require 'date'
# 平成の日付文字をdateオブジェクトに
def convert_heisei_to_date(heisei_text)
  begin
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i
    Date.new(year,month,day)
  rescue
    # 例外が起きたらnilを返したい
    nil
  end
end

#　どのエラーを吐くかを考えて実装する
require 'date'
# 平成の日付文字をdateオブジェクトに
def convert_heisei_to_date(heisei_text)
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i
    begin
      Date.new(year, month, day)
    rescue ArgumentError
      # 例外が起きたらnilを返したい
      nil
    end
end

convert_heisei_to_date('平成28年12月31日')
convert_heisei_to_date('平成28年12月41日')

# irb(main):050:0> convert_heisei_to_date('平成28年12月31日')
# => #<Date: 2016-12-31 ((2457754j,0s,0n),+0s,2299161j)>
# irb(main):051:0> convert_heisei_to_date('平成28年12月41日')
# => nil

#分岐にしちゃえばいい
require 'date'
# 平成の日付文字をdateオブジェクトに
def convert_heisei_to_date(heisei_text)
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i
    if Date.valid_date?(year, month, day)
      Date.new(year, month, day)
    end
end

convert_heisei_to_date('平成28年12月31日')
convert_heisei_to_date('平成28年12月41日')

# irb(main):027:0> convert_heisei_to_date('平成28年12月31日')
# => #<Date: 2016-12-31 ((2457754j,0s,0n),+0s,2299161j)>
# irb(main):028:0> convert_heisei_to_date('平成28年12月41日')
# => nil

# 予期しない条件は以上終了させる

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  end
end

currency_of(:italy)

# irb(main):041:0> currency_of(:italy)
# => nil

currency = currency_of(:italy)
currency.upcase
# NoMethodError (undefined method `upcase' for nil:NilClass)
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  else
    'rupee'
  end
end

currency = currency_of(:italy)
# irb(main):055:0> currency = currency_of(:italy)
# => "rupee"

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    raise ArgumentError, "無効な国名です#{country}"
  end
end

currency_of(:italy)
# ArgumentError (無効な国名ですitaly)

# ensure
# 例外あってもなくても必ず実行したいしょり
begin
  # 例外が発生すrkま
rescure
  # 例外が発生したら
ensure
  # 例外有無にかかわらず
end

file = File.open('some.txt','w')
begin
  # ファイルに文字列を書き込む
  file << 'Hello'
ensure
  # 例外有無にかかわ必ずクローズする
  file.close
end

# ブロック付きでオープンすると自動的にクローズさえる

File.open('some.txt','w') do |file|
  file << 'Hello'
end

File.open('some.txt','w') do |file|
  file << 'Hello'
end

File.open('some.txt','w') do |file|
  file << 'Hello'
  1 / 0
end
# ZeroDivisionError (divided by 0)

# 例外処理のelse
#

begin
  puts 'Hello'
rescue
  puts '例外が発生しました'
else
  puts '例外発生しませんでした'
end
# Hello
# 例外発生しませんでした
# => nil

# 例外処理と戻り値
ret =
  begin
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end

ret
# irb(main):041:0> ret
# => "OK"
ret =
  begin
    1/0
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end

  ret

#   irb(main):053:0>   ret
# => "error"

def some_method(n)
  begin
    1/n
  rescue
    'error'
  ensure
    'ensure'
  end
end

# irb(main):063:0> some_method(1)
# => 1
# irb(main):064:0> some_method(2)
# => 0
# irb(main):065:0> some_method(0)
# => "error"

# ensureではreturn使わねえ
def some_method(n)
  begin
    1/n
  rescue
    'error'
  ensure
    return 'ensure'
  end
end

# irb(main):085:0> some_method(0)
# => "ensure"

def some_method(n)
  begin
    1/n
  ensure
    return 'ensure'
  end
end

some_method(1)
some_method(0)

# irb(main):095:0> some_method(1)
# => "ensure"
# irb(main):096:0> some_method(0)
# => "ensure"

# 例外が発生しそうな処理 rescue 例外が発生したときの戻り値
# 例外が発生しない場合
1 / 1 rescue 0
# irb(main):098:0> 1 / 1 rescue 0
# => 1
# 例外は発生する場合
1 / 0 rescue 0
# irb(main):100:0> 1 / 0 rescue 0
# => 0

# begin/endを省略するrescure

rescue 'date'
def to_date(string)
  begin
    Date.parse(string)
  rescue ArgumentError
    nil
  end
end

to_date('2017-01-01')
to_date('abcdef')

rescue 'date'
  def to_date(string)
    Date.parse(string) rescue nil# 細かくできない
  end

  to_date('2017-01-01')
  to_date('abcdef')

  # $!と$@に格納される例外処理
  begin
    1/0
    'OK'
  rescue => e
    puts "#{e.class} #{e.message}"
    puts e.backtrace
  end
  ZeroDivisionError divided by 0

  # 組込変数の$!と$@に格納された例外情報を使う
  begin
    1/0
  rescue => e
    puts "#{$!.class} #{$@.message}"
    puts $@
  end

  def fizz_bazz(n)
    begin
      if n % 15 == 0
        'Fizz Buzz'
      elsif n % 3 == 0
        'Fizz'
      elsif n % 5 == 0
        'Buzz'
      end
    rescue => e
      puts "#{e.class} #{e.message}"
    end
  end
  def fizz_bazz(n)
    if n % 15 == 0
      'Fizz Buzz'
    elsif n % 3 == 0
      'Fizz'
    elsif n % 5 == 0
      'Buzz'
    end
    rescue => e
      puts "#{e.class} #{e.message}"
    end
  end
  fizz_bazz(nil)

  def some_method
    1 / 0
    rescue => e
      puts "エラーが発生しました #{e.mesage}"
      puts e.backtrace
    end
  end

  begin
    some_method
  rescue => e
    puts "エラーが発生しました #{e.class} #{e.message}"
    puts e.backtrace
    original = e.cause
    unless original.nil?
      puts "エラーが発生しました #{original.class} #{original.message}"
      puts original.backtrace
    end
  end
  # NoMethodError (undefined method `mesage' for #<ZeroDivisionError: divided by 0>)

  # /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
  # エラーが発生しました ZeroDivisionError divided by 0
# rescurした例外を再度発生さえる
def fizz_buzz(n)
  if n % 15 == 0
    'Fizz Buzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
  rescue => e
    puts "[LOG]エラーが発生しました#{e.class} #{e.message}"
    raise
end

fizz_buzz(nil)
#[LOG]エラーが発生しましたNoMethodError undefined method `%' for nil:NilClass

# 独自の例外クラスを定義する
class NoCountryError < StandardError
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 意図的に例外を発生
    raise NoCountryError,"無効な国名です#{country}"
  end
end

currency_of(:italy)
# NoCountryError (無効な国名ですitaly)

# 独自の例外クラスを定義する
class NoCountryError < StandardError
  attr_reader :country

  def initialize(message, country)
    @country = country
    super("#{message}#{country}")
  end
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 意図的に例外を発生
    raise NoCountryError.new("無効な国名です。", country)
  end
end

begin
  currency_of(:italy)
rescue NoCountryError => e
  puts e.message
  puts e.country
end

# 無効な国名です。italy
# italy