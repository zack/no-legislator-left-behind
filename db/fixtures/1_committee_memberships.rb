Legislator.where(state: 'MA').each do |l|
  (rand(1)+5).times do
    c = Committee.where(state: 'MA', body: [l.body, 'Joint']).sample
    start_date = Faker::Date.between("2009-01-01", "2017-12-31")

    if CommitteeMembership.where(committee_id: c.id, legislator_id: l.id).length === 0
      CommitteeMembership.seed do |m|
        m.committee_id = c.id
        m.end_date = Faker::Date.between(start_date, "2017-12-13") if [true, false].sample
        m.legislator_id = l.id
        m.start_date = start_date
      end
    end
  end
end
