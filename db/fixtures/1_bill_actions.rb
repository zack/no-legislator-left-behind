# def maybe
  # [true, false].sample
# end

# 5000.times do
  # bill_id = rand(1..500)
  # bill = Bill.find(bill_id)
  # action_date = Faker::Date.between("#{bill.session}-01-01", "#{bill.session}-12-31")

  # BillAction.seed do |b|
    # b.action         = BillHelper.actions.sample
    # b.action_date    = action_date
    # b.becomes_bill   = rand(bill_id..500) if maybe
    # b.bill_id        = bill_id
    # b.scheduled_date = Faker::Date.between(action_date, "#{bill.session}-12-13") if maybe
  # end
# end
