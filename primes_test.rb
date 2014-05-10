require 'rubygems'
require 'test/unit'
require './primes.rb'

class PrimesTest < Test::Unit::TestCase

  def test_prime?
    assert_equal(true, prime?(2))
    assert_equal(true, prime?(3))
    assert_equal(false, prime?(4))
    assert_equal(true, prime?(5))
    assert_equal(true, prime?(7))
  end

  def test_first_n_primes
    assert_equal([2,3,5,7], first_n_primes(4))
  end

end