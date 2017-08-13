500.times do |id|
  BillSponsor.seed do |s|
    s.bill_id = id+1
    s.legislator_id = rand(100)+1
  end
end
