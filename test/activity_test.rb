require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  attr_reader :playdate

  def setup
    @playdate = Activity.new("Brunch", {name: ["Cereza", "Sandra"], cost: [50, 40]})
  end

  def test_it_exists
    assert_instance_of Activity, playdate
  end

  def test_it_has_an_activity
    assert_equal "Brunch", playdate.activity
  end

  def test_it_has_participants
    assert_equal ["Cereza", "Sandra"], playdate.names
  end

  def test_each_has_their_own_bill
    assert_equal 50, playdate.bills[0]
  end

  def test_can_add_participants
    playdate.add_participant("Lola", 60)
    assert_equal ["Cereza", "Sandra", "Lola"], playdate.names
    assert_equal [50, 40, 60], playdate.bills
    assert_equal 150, playdate.total_tab
  end

  def test_can_access_total_bill
    assert_equal 90, playdate.total_tab
  end

  def test_can_split_bill_evenly_between_participants
    assert_equal 45, playdate.split_bill
  end

  def test_participant_owes_after_bill_difference
    assert_equal 5, playdate.bill_difference("Cereza")
  end

  def test_participant_is_owed_after_bill_difference
    assert_equal -5, playdate.bill_difference("Sandra")
  end


end
