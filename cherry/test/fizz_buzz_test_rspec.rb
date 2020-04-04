require './lib/fizz_buzz'

RSpec.describe 'Fizz Buzz' do
  example 'fizz_buzz' do |variable|
    expect(fizz_buzz(1)).to_eq '1'
  end
end