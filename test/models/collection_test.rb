require "test_helper"

class CollectionTest < ActiveSupport::TestCase
  test "should not save empty collection" do
    collection = Collection.new
    collection.save
    refute collection.valid?
  end

  test "should save collection from sign in user" do
    @user = users(:one)
    sign_in users(:one)

    collection = Collection.new
    collection.save
    refute collection.valid?
  end
end
