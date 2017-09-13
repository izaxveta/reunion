class Reunion
  attr_reader :location,
              :activity
  def initialize(location, activity)
    @location = location
    @activity = [activity]
  end

  def add_activity(new_activity)
    activity << new_activity
  end

  def total_cost
    total = activity.map do |plan|
      plan.total_tab
    end
    total.sum
  end
  
end
