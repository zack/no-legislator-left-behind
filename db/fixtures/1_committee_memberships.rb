1000.times do
  start_date = Faker::Date.between("2009-01-01", "2017-12-31")
  legislator = Legislator.find(rand(1..1000))
  body = [legislator.body, 'Joint'].sample

  CommitteeMembership.seed do |c|
    c.committee_id = Committee.where(body: body).to_a.sample.id
    c.end_date = Faker::Date.between(start_date, "2017-12-13") if [true, false].sample
    c.legislator_id = legislator.id
    c.start_date = start_date
  end
end
