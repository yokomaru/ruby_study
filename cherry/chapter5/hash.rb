{'japan' => 'yen', 'japan' => '円'}
# (irb):3: warning: key "japan" is duplicated and overwritten on line 3
# => {"japan"=>"円"}

currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies['italuy'] = 'euro'
currencies

currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies['japan'] = '円'
currencies

currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies.each do |key, value|
  puts "#{key} : #{value}"
end

currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  puts "#{key} : #{value}"
end

a = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
b = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

## シンボル
### シンボルを任意の文字列と一対一に対応するオブジェクトです。
### 文字列の代わりに用いることもできますが必ずしも文字列と同じ振る舞いをするわけ
### 内部で整数として管理される
### 同じシンボルは同じオブジェクト
### 破壊的な変更が不可能
# => 1517468
# irb(main):027:0> 'apple'.object_id
# => 70331662807100
# irb(main):028:0> 'apple'.object_id
# => 70331662821180
# irb(main):029:0> 'apple'.object_id
# => 70331646119060

# 引数二キーワード引数を使うといいかもしれない
def menu(menu, key1: true, key2: true)
end

# has_key?/key?/inckude?/member?
# ハッシュのてんかい
h = {us: 'dollar', india: 'rupee'}
{ japan: 'yen' , **h }

def buy_burger(menu, options ={})
  drink = options[:drink]
  potato = options[:potato]
end

buy_burger('cheese', drink: true, potato: true)

currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
currencies.to_a
array = currencies
array.to_s

### ハッシュの初期値
h = Hash.new('hello')
a = h[:foo]
b = h[:bar]

a.equal?(b)
a.upcase!

a
b

h

### ハッシュの初期値
h = Hash.new{'hello'}
a = h[:foo]
b = h[:bar]

a.equal?(b)
a.upcase!

a
b

h

### ハッシュの初期値
h = Hash.new{|hash,key| hash[key] = 'hello'}
h[:foo]
h[:bar]
h

