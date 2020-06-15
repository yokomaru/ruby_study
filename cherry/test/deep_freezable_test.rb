require 'minitest/autorun'
require './lib/bank'
require './lib/team'

class DeepFreezableTest < Minitest::Test
  def test_deep_freezable_to_array
    # 配列の値は正しいか？
    assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES
    assert Team::COUNTRIES.frozen?
    assert Team::COUNTRIES.all? {|country| country.frozen? }
  end

  def test_deep_freezable_to_hash
    # ハッシュの値は正しいか？
    assert_equal(
      { 'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' } ,
      Bank::CURRENCIES
    )
    # ハッシュ自身がfreezeされてるか
    assert Bank::CURRENCIES.frozen?
    # ハッシュの要素がfreezeされてるか
    assert Bank::CURRENCIES.all? { |key, value| key.frozen? && value.frozen? }
  end
end