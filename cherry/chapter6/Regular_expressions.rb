text = <<TEXT
I love Ruby.
Python is agreat language.
Java and javascript are different.
TEXT

text.scan(/[A-Z][A-Za-z]+/)

text = <<TEXT
私の郵便番号は123-4567です。
僕の住所は999-9999、A県B市1234です。
TEXT

text.gsub(/(\d{3})(\d{4})/, '\1-\2')
#Regexpクラス
regex = /\d{3}-\d{4}/
regex.class

#位置を返す
'123-4567' =~ /\d{3}-\d{4}/
'hello' =~ /\d{3}-\d{4}/

#マッチしなかった時true
'123-4567' !~ /\d{3}-\d{4}/
'hello' !~ /\d{3}-\d{4}/

#私の誕生日は'1997年7月17日'です。
#(\d+)年(\d+)月(\d+)日
#(\d+)年(\d+)月(\d+).match(text)

text = '私の誕生日は1997年7月17日です。'

if /(\d+)年(\d+)月(\d+)/.match(text)

elsif

end

m = /(\d+)年(\d+)月(\d+)/.match(text)
m= text.match(/(\d+)年(\d+)月(\d+)/)
#irb(main):006:0> m[0]
#=> "1997年7月17"
#irb(main):007:0> m[1]
#=> "1997"
#irb(main):008:0> m[2,2]
#=> ["7", "17"]
#irb(main):009:0> m[-1]
#=> "17"
#irb(main):010:0> m[1..3]
#=> ["1997", "7", "17"]

# キャプチャの結果に名前をつける
(?<year>)\
/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)/.match(text)
# シンボルで名前を指定してキャプチャの結果を取得する
m[:year]
m[:monßth]
m[:day]
#irb(main):018:0> m[:year]
#=> "1997"
#irb(main):019:0> m[:month]
#=> "7"
#irb(main):020:0> m[:day]
#=> "17"

if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text) =~ text
  puts "#{year}/#{month}/#{day}"
end

if text =~ /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
  puts "#{year}/#{month}/#{day}"
end


# 無効
text = '私の誕生日は1997年7月17日です。'
regexp = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/

if regexp =~ text
  puts "#{year}/#{month}/#{day}"
end

#Stringのメソッド
# scan　マッチした部分を配列に
'123 456 789'.scan(/\d+/)

# 正規表現に()があるとキャプチャされた部分が配列の配列に
'1977年7月17日 2016年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/)
# グループ化はしたいがキャプチャはしたくない(マッチした文字列全体を取得したい場合、(?:)というメタ文字を使ってください)
'1977年7月17日 2016年12月31日'.scan(/(?:\d+)年(?:\d+)月(?:\d+)日/)
# 一緒
'1977年7月17日 2016年12月31日'.scan(/\d+年\d+月\d+日/)
# [],slice,slice!
#[]正規表現渡すと文字列から正規表現にマッチした部分抜き出す
text = '郵便番号は123-4567です'
text[/\d{3}-\d{4}/]
# 最初に一致した文字
text = '123-4567　222-2222'
text[/\d{3}-\d{4}/]

text = '私の誕生日は1997年7月17日です。'
text[/(\d+)年(\d+)月(\d+)日/]
#irb(main):031:0> text[/(\d+)年(\d+)月(\d+)日/,3]
#=> "17"

#名前月キャプチャもできる
text = '私の誕生日は1997年7月17日です。'
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/,:day]
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/,'day']

#slice []エイリアス
text = '郵便番号は123-4567です'
text.slice(/\d{3}-\d{4}/)
# 最初に一致した文字
text.slice(/\d{3}-\d{4}/,3)

#slice!切り取る
text = '郵便番号は123-4567です'
text.slice!(/\d{3}-\d{4}/)
text

#aplitに正規表現を渡すとマッチした文字列を区切り文字にして文字列を分解し、配列として返す
text = '123,456-456'
text.split(',')
# カンマまたはハイフン
text.split(/,|-/)

#irb(main):057:0> text = '123,456-456'
#=> "123,456-456"
#irb(main):058:0> text.split(',')
#=> ["123", "456-456"]
#irb(main):059:0> text.split(/,|-/)
#=> ["123", "456", "456"]

# gsubメソッドを使うと１引数を２に変更
#正規表現渡すとマッチした部分第２匹すうにを置き換える
text = '123,456-456'
text.gsub(',', ':')
text.gsub(/,|-/, ':')

# irb(main):062:0> text = '123,456-456'
# => "123,456-456"
# irb(main):063:0> text.gsub(',', ':')
# => "123:456-456"
# irb(main):064:0> text.gsub(/,|-/, ':')
# => "123:456:456"

text = '私の誕生日は1997年7月17日です。'
text.gsub(/(\d+)年(\d+)月(\d+)日/,'\1-\2-\3')

# irb(main):065:0> text = '私の誕生日は1997年7月17日です。'
# => "私の誕生日は1997年7月17日です。"
# irb(main):066:0> text.gsub(/(\d+)年(\d+)月(\d+)日/,'\1-\2-\3')
# => "私の誕生日は1997-7-17です。"

#名前月キャプチャもで変換
text = '私の誕生日は1997年7月17日です。'
text.gsub(/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, '\k<year>-\k<month>-\k<day>')

# 変換ルールを指定
text = '123,456-456'
hash = {',' => ':', '-' => '/'}
text.gsub(/,|-/, hash)

# ブロックの戻り値で置き換える文字列を指定することもできる
text = '123,456-456'
text.gsub(/,|-/){|matched| matched == ',' ? ':' : '/'}

# gsubメソッドを使うと１引数を２に変更
# 破壊的に置換します
text = '123,456-456'
text.gsub!(/,|-/, ':')
text

# キーがシンボルなら新しいハッシュ記法に変換する
old_syntax = <<TEXT
{
  :name => 'Alice',
  :age => 20,
  :gender => :female
}
TEXT
convert_hash_syntax(old_syntax)

##Regexp.new
Regexp.new(/\d{3}-\d{4}/)

#　スラッシュで囲むとスラッシュをエスケープ する必要がある
/http:\/\/example\.com/
# rはエスケープしなくていい
%r!http://example\.com!

%r{http://example\.com}

#irb(main):001:0> Regexp.new(/\d{3}-\d{4}/)
#=> /\d{3}-\d{4}/
#irb(main):002:0> /http:\/\/example\.com/
#=> /http:\/\/example\.com/
#irb(main):003:0> %r!http://example\.com

pattern = '\d{3}-\d{4}'
'123-4567'　=~ /#{pattern}/

text = '03-1234-5678'
case text
when /^\d{3}-\d{4}$/
  puts '郵便番号です'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です'
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end

# iオプションは大文字小文字を区別しない
'HELLO' =~ /hello/i
# iオプションは大文字小文字を区別しない
'HELLO' =~%r{hello}i

# Regexp::IGNORECASE 定数を渡す
regexp = Regexp.new('hello',Regexp::IGNORECASE)
'HELLO' =~ regexp

# mオプションを使うと任意の文字を表すドットが開業文字にもマッチするようになります
"Hello\nBye" =~ /Hello.Bye/

# mオプションを使うと任意の文字を表すドットが開業文字にもマッチしない
"Hello\nBye" =~ /Hello.Bye/m

# Regexp::IGNORECASE 定数を渡す
regexp = Regexp.new('Hello.Bye',Regexp::MULTILINE)
"Hello\nBye" =~ regexp

#xオプションを使うと空白文字が無視され、＃を使って正規表現中にコメントが書けるようになる
regexp =/
  \d{3} #郵便番号先頭３桁
  -     #釘血文字のハイフン
  \d{4} #郵便番号後ろ4桁
/x

'123-1234' =~ regexp

#xオプションを使うと空白文字を正規表現と一部として扱いたい場合ｈバックスラッシュでエスケープ
regexp =/
  \d{3} #郵便番号先頭３桁
  \    #釘血文字のハイフン
  \d{4} #郵便番号後ろ4桁
/x

'123 1234' =~ regexp

# Regexp.newを使う場合はRegexp::EXTENDEDという定数を渡す
# キーがシンボルなら新しいハッシュ記法に変換する
pattern = <<'TEXT'
  \d{3} #郵便番号先頭３桁
  -     #釘血文字のハイフン
  \d{4} #郵便番号後ろ4桁
TEXT
regexp = Regexp.new(pattern, Regexp::EXTENDED)
'123-1234' =~ regexp

# オプションは同時に使えるよ
"HELLO\nBYE" =~ /Hello.Bye/im


# |で連結
regexp = Regexp.new('hello.Bye',Regexp::IGNORECASE | Regexp::MULTILINE)
"HELLO\nBYE" =~ regexp

# 組込変数でマッチの結果を取得
text = '私の誕生日は1997年7月17日です。'
# =~やmatchを使うとマッチした結果が組込変数に代入される
text =~ /(\d+)年(\d+)月(\d+)日/
# matchdataobjectを取得する
$~
$& # マッチした全体を取得する

#irb(main):027:0> text = '私の誕生日は1997年7月17日です。'
#=> "私の誕生日は1997年7月17日です。"
#irb(main):028:0> text =~ /(\d+)年(\d+)月(\d+)日/
#=> 6
#irb(main):030:0> $~
#=> #<MatchData "1997年7月17日" 1:"1997" 2:"7" 3:"17">

$1
$2
$3
# irb(main):032:0> $1
# => "1997"
# irb(main):033:0> $2
# => "7"
# irb(main):034:0> $3
# => "17"

$+
# irb(main):035:0> $+
# => "17"

# 組込変数でマッチの結果を取得
text = '私の誕生日は1997年7月17日です。'
# =~やを使うとRegexp.last_match(0)で取得できる
text =~ /(\d+)年(\d+)月(\d+)日/
# matchdataobjectを取得する
Regexp.last_match
# マッチした部分全体を取得数ｒ
Regexp.last_match(0)

Regexp.last_match(1)
Regexp.last_match(2)
Regexp.last_match(3)
Regexp.last_match(-1)

# irb(main):037:0> text = '私の誕生日は1997年7月17日です。'
# => "私の誕生日は1997年7月17日です。"
# irb(main):038:0> # =~やを使うとRegexp.last_match(0)で取得できる
# => nil
# irb(main):039:0> text =~ /(\d+)年(\d+)月(\d+)日/
# => 6
# irb(main):040:0> # matchdataobjectを取得する
# => nil
# irb(main):041:0> Regexp.last_match
# => #<MatchData "1997年7月17日" 1:"1997" 2:"7" 3:"17">
# irb(main):042:0> # マッチした部分全体を取得数ｒ
# => nil
# irb(main):043:0> Regexp.last_match(0)
# => "1997年7月17日"
# irb(main):044:0>
# irb(main):045:0> Regexp.last_match(1)
# => "1997"
# irb(main):046:0> Regexp.last_match(2)
# => "7"
# irb(main):047:0> Regexp.last_match(3)
# => "17"
# irb(main):048:0> Regexp.last_match(-1)
# => "17"

# match?マッチすればtrueを返す
/\d{3}-\d{4}/.match?('123-4567')
#irb(main):049:0> /\d{3}-\d{4}/.match?('123-4567')
#=> true

#マッチしても組込変数やRegexp.last_matchを書き換えない
$~
Regesp.last_match

'123-4567'.match?(/\d{3}-\d{4}/)

