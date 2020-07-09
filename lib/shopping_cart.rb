class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    result = {:name => @name,
              :capacity => @capacity.delete("items").to_i}
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    total_number_of_products > @capacity.to_i
  end

  def products_by_category(category)
    @products.select do |product|
      product.category == category
    end
  end

  def percentage_occupied
    result = (total_number_of_products.to_f / details[:capacity].to_f) * 100
    result.round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end
  end

  def product_breakdown
    result = Hash.new { |hash, key| result[key] = [] }
    @products.each do |product|
      result[product.category] << product
    end
    result
  end

end
