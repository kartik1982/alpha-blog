require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    assert @category.valid?
  end
  
  test "category name should be present" do
    @category.name= " "
    assert_not @category.valid?
  end
  
  test "Category name should be not more than 25 character" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  test "category name should not be samller than 3 charater" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
  test "name should be nique" do
    @category.save
    category2= Category.new(name: "sports")
    assert_not category2.valid?
  end
end