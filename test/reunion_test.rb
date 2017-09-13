require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/reunion'

class ReunionTest < Minitest::Test
  attr_reader :reunion,
              :playdate,
              :selfie_shoot
  def setup
    @playdate = Activity.new("Brunch", {name: ["Cereza", "Sandra"], cost: [50, 40]})
    @selfie_shoot = Activity.new("Self Indulging", {name: ["Cereza", "Sandra"], cost: [300, 200]})
    @reunion = Reunion.new("Miami", playdate)
  end

  def test_it_exists
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_location
    assert_equal "Miami", reunion.location
  end

  def test_it_has_an_activity
    assert_equal [playdate], reunion.activity
  end

  def test_you_can_add_activity_to_reunion
    assert_equal [playdate, selfie_shoot], reunion.add_activity(selfie_shoot)
  end

  def test_total_cost_returns_total_spent_during_reunion
    assert_equal [playdate, selfie_shoot], reunion.add_activity(selfie_shoot)
    assert_equal 590, reunion.total_cost
  end
end
