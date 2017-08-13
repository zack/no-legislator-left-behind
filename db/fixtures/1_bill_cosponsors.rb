1500.times do |id|
  BillCosponsor.seed do |s|
    s.bill_id = (id/3)+1
    s.legislator_id = rand(100)+1
  end
end
