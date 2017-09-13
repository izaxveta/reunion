class Activity
  attr_reader :activity,
              :names,
              :bills,
              :total_tab

  def initialize(activity, participants)
    @activity = activity
    @names = participants[:name]
    @bills = participants[:cost]
    @total_tab = participants[:cost].sum
  end

  def split_bill
    total_tab/names.count
  end

  def bill_difference(name)
    index = names.index(name)
    bill = bills[index]
    bill - split_bill
  end

end
