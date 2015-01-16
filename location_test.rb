require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should have_many(:camps)

  should validate_presence_of(:name)
  should validate_presence_of(:steet_1)
  should validate_presence_of(:max_capacity)
  should validate_presence_of(:zip)

  should allow_value("PA").for(:state)
  should allow_value("CA").for(:state)
  should not allow_value

end
