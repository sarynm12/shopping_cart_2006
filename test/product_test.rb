require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'

class ProductTest < Minitest::Test

  def test_it_exists
    product = Product.new(:paper, 'toilet paper', 3.70, '10')
    assert_instance_of Product, product
  end

  def test_it_has_a_category
    product = Product.new(:paper, 'toilet paper', 3.70, '10')
    assert_equal :paper, product.category
  end

  def test_it_has_a_name
    product = Product.new(:paper, 'toilet paper', 3.70, '10')
    assert_equal 'toilet paper', product.name
  end

  def test_it_has_a_unit_price
    product = Product.new(:paper, 'toilet paper', 3.70, '10')
    assert_equal 3.70, product.unit_price
  end

  def test_it_has_a_quantity
    product = Product.new(:paper, 'toilet paper', 3.70, '10')
    assert_equal 10, product.quantity
  end

  def test_it_can_get_total_price
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    
    assert_equal 37.0, product1.total_price
    assert_equal 9.0, product2.total_price
  end
end

# ## Iteration 1
#
# Start by making the existing tests pass (removing the skips as you go), and then use TDD to update the `Product` class that responds to the following interaction pattern:
#
# ```ruby
# pry(main)> require './lib/product'
# #=> true
#
# pry(main)> product = Product.new(:paper, 'toilet paper', 3.70, '10')
#
# #=> #<Product:0x00007fa53b9ca0a8 @category=:paper, @name="toilet paper", @quantity='10', @unit_price=3.70>
#
# pry(main)> product.category
# #=> :paper
#
# pry(main)> product.name
# #=> "toilet paper"
#
# pry(main)> product.unit_price
# #=> 3.70
#
# pry(main)> product.quantity
# #=> 10
#
# pry(main)> product.total_price
# #=> 37.0
#
# pry(main)> product.is_hoarded?
# #=> false
#
# pry(main)> product.hoard
#
# pry(main)> product.is_hoarded?
# #=> true
# ``
