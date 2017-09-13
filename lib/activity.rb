class Activity
  attr_reader :activity,
              :names,
              :bills
  attr_accessor :total_tab

  def initialize(activity, participants)
    @activity = activity
    @names = participants[:name]
    @bills = participants[:cost]
    @total_tab = bills.sum
  end

  def split_bill
    total_tab/names.count
  end

  def add_participant(name, bill)
    names << name
    bills << bill
    @total_tab += bill
  end

  def bill_difference(name)
    index = names.index(name)
    bill = bills[index]
    bill - split_bill
  end

end
