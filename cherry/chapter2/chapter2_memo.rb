# 文字列
'1'.to_s
# 数値
1.to_s
# nil
nil.to_s
# true
true.to_s
# false
false.to_s
# 正規表現
/\d+/.to_s

# 引数は下記２パターンで渡せる
1.to_s
1.to_s()

# 16進数
10.to_s(16)
10.to_s 16

# 文章の区切り
'1'.to_s; nil.to_s; 10.to_s(16);

# ()で文の途中の改行
10.to_s(
16
)

# バックスラッシュを使う
10.to_s \
16

# #でコメント
=begin
コメ
=end

# 予約後
BEGIN END alias and begin break case
class def defined? do else elsif end
ensure false for if in module next
nil not or redo rescue unlesss until
when while yield __LINE__ __FILE__ __ENCODING__

## めっちゃ空白あっても動く
(5+1         - 2) * 3

def
            add (a,b)


a + b
end
add(            4,5    )

# リテラル
## 数値
123

# 文字列
"hello"

# 配列
[1, 2, 3]

# ハッシュ
{'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

# 正規表現
/\d+-\d+/

# 変数単体は怒られる何か入れう
#x
# 変数はスネークケース
# aaa_aaaa
# _aaaa
# aaaa_2
# 怒られる
# 2_www
# 日本語もOK
ああああ　= "eeee"

# ２つ一期もOK
a,b = 1,2
c,d = 1
e,f = 1,2,3

# まとめて
a = b = 100

# "" 特殊文字可能
puts "こんにちは/nさようなら"
puts 'こんにちは/nさようなら'

name = "eli"
outs "Hello,#{name}"
puts 'aaaa\'aaa'
puts "aaaa,\"aaaa\""

# 文字列の比較
'ruby' == 'ruby'
'ruby' == 'rub'
'ruby' != 'rub'
'ruby' != 'ruby'

# 文字コードの大小比較
'a' < 'b'
'a' < 'A'
'a' > 'A'
'abc' < 'def'
'abc' < 'ab'
'abc' < 'abcd'
'あいうえお' < 'かきくけこ'

# 数値
## 整数同士の割り算
1/2 == 0
1.0 /2 # 0.5
n = 1
n.to_f # float型に
# あまり
8 % 3 # 2

# べき乗
2 ** 3 #8

## 演算子の優先順位
### * & / > + & -
(2 * 3) + (4 * 5) - (6 /2)
2 * 3 + 4 * 5 - 6 /2

## 演算子の優先
::
[]
+(単項) ! ~
**
- (単項)
* / %
+ -
<< >>
&
| ^
> >= < <=
<=> == === != =~ !~
&&
||
.. ...
?:(条件演算子)
= (+=, -= )
not
and or

# 増減
n = 1
n++

n += 1
n -= 1

n = 2
n *= 3
n /= 2
n ** 2

# rubyは暗黙の型変換はない
num = 2
"aaaa" + 2.to_s
# 自動的にto_sなる
"aaaa#{num}"

## まるめ誤差
0.1 * 3.0

0.1 * 3.0 == 0.3
0.1 * 3.0 <= 0.3

## rational(有理数)分数表記
0.1r * 3r == 0.3　# 1/3
0.1r * 3.0r <= 0.3

a = 0.1
b = 3.0
# 数値にしたいなら to_f
(0.1r * 3.0r).to_f

## 真偽値
# 全て真
true
1
0
-1
'true'
'false'
''
# 偽
false
nil

data = find_data
if data # falseとnil以外全て真
  'データがあります'
else
  'データがありません'
end

# ifは戻り値として返す
a = if data # falseとnil以外全て真
  'データがあります'
else
  'データがありません'
end

point = 7
day = 1
if day == 1
  point *= 5
end

# 変数と同じルール
def add(a,b)
  a + b
end
add(2,3)

### 文字列
'abc'.class

### %q! !はシングルクオートで囲んだことと同じになる
puts %q!He said, "Don't speak."!

### %Q! !はダブルクオートで囲んだことと同じになる
something = "Hello"
puts %Q!He said, "#{something}"!

### %Q! !はダブルクオートで囲んだことと同じになる
something = "Bye."
puts %!He said, "#{something}"!

### ?{}もおけ
something = "Hello"
puts %Q?He said, "#{something}"?
puts %Q{He said, "#{something}"}

### 行しこう文字列リテラル
puts "ssss,
ssss"

### ヒあドキュメント
### <<識別子
###　aaaa
### 識別子

a = << TEXT
これはテスト
です
TEXT
<<HTML
<div></div>
HTML
puts a

def some_method
  <<-TEXT
  今日わ
  TEXT
end
puts some_method

eee = 'sss'
a = <<-TEXT
  #{eee}
  今日わ
  TEXT
puts a

eee = 'sss'
a = <<-'TEXT'
  #{eee}
  今日わ
  TEXT
puts a

eee = 'sss'
a = <<-"TEXT"
  #{eee}
  今日わ
  TEXT
puts a

a = 'Ruby'
a.prepend(<<-TEXT)
Java
PHP
TEXT
puts a

b = <<TEXT.upcase
Hello,
Good-bye.
TEXT
puts b

### フォーマットを指定して文字列を作る
### sprintf
### フォーマット文字列　% 表示したいオブジェクト
sprintf('%0.3f',1.2)
sprintf('%0.3f + %0.3f', 1.2, 0.48)

##配列
[1,2,3].join
'Hi!' * 10

### 数値について１０真数以外の生活整数リテラル
0b11111111 # 16進数
0377 # 8進数
0xff #16進数

##　ビット演算

# ~ : ビット反転
# & : ビット積
# | : ビット和
# ^ : 排他的論理和
# >>: 右ビットシフト
# <<: 左ビットシフト
(0b1010).to_s(2)
(~0b1010).to_s(2)
(0b1010 & 0b1100).to_s(2)
(0b1010 | 0b1100).to_s(2)
(0b1010 ^ 0b1100).to_s(2)
(0b1010 >> 1).to_s(2)
(0b1010 << 1).to_s(2)
(0b1010 | 0b1010).to_s(2)

### 指数表現
2e-3

10.class
1.5.class
2e-3.class

r = 2 / 3r
r.class

r = '2/3'.to_r
r.class

# 複素数リテラル
c = 0.3 - 0.5i
c.class

# 文字列から複素数リテラル
c = '0.3-0.5i'.to_c
c.class

## 全てNumericクラスのサブクラス

# 真偽値　左から順に評価する
1 && 2 && 3
1 && nil && 3
1 && false && 3

nil || false
false || nil
nil || false || 2 || 3

user = find_user('Alice') ||find_user('Bob') ||find_user('Carol')
user.valid? && send_mail_to(user)

# and or not は優先順位が低い
# 制御フローに使うと良い

def greeting(country)
  # countryがnil（またはfalse）ならメッセージを返してメソッドを抜ける
  country or return 'countryを入力してください'

  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end

greeting(nil)
greeting('aaa')

# unless
status = 'error'
if status != 'ok'
  'エラー'
end

status = 'error'
unless status == 'ok'
  'エラー'
end

# unless就修飾子
'エラー' unless status == 'ok'

# 参考演算子
n = 11
if n >10
  '10より大きい'
else
  '10以下'
end

n = 11
n > 10 ? '10より大きい' : '10以下'

n = 11
message = n > 10 ? '10より大きい' : '10以下'

## デフォルと値
def test(s = japan)
  s
end

def foo(time = Time.now, message = bar)
  puts "time: #{time}, message: #{message}"
end

def bar
  'Bar'
end

# メソッド? (真偽値を返す)
''.empty?
'abc'.empty?

'watch'.include?('at')
'watch'.include?('dh')

1.odd?
2.odd?

1.even?
2.even?
nul.nil?

# 自分で定義できる
def multiple_of_three?(n)
  n % 3 == 0
end

multiple_of_three?(3)
multiple_of_three?(4)
multiple_of_three?(5)

# メソッド! (破壊的メソッド)呼び出し側に変更を与える
a = 'ruby'
a.upcase
a.upcase!

# 変数名には？！は使えない
def reverse_upcase!(s)
  s.reverse!.upcase!
end
# 違うけど同じ　エイリアスメソｄっど
'hello'.length
'hello'.size

#疑似変数
# self:オブジェクト自身
# __FILE__　: 現在のソースファイル名
# __LINE__  :  現在のソースファイルの中の番号
# __ENCODING__ :　現在のそーすのエンコーディング

# rubyの変数はオブジェクトへの参照
a = 'hello'
b = 'hello'
a.object_id
b.object_id

c = b
c.object_id

def m(d)
  d.object_id
end
m(c)

a.equal?(b)
b.equal?(c)

# 組み込みライブラリじゃない
require 'date'
Date.today

# requireは一回だけ、loadはつど

# puts 改行を加えて変数の内容や戻り値を表示。メソッド自身の戻り値はnil
# print 改行なし
# p 文字列は”で囲まれる　オブジェクトそのものがメソッドの戻り値になる
puts 123
print 123
p 123

puts 'abc'
print 'abc'
p 'abc'

c = [1,2,3]
puts c #to_s
print c #to_s
p c #inspectの方が開発者むき