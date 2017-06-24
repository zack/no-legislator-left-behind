(rand(300)+200).times do
  Legislator.seed do |l|
    l.body = 'House'
    l.first_name = Faker::Name.first_name
    l.last_name = Faker::Name.last_name
    l.state = 'MA'
    l.party = rand > 0.05 ? ['Democrat', 'Republican'].sample : 'Independent'
    l.district = "#{(rand(40)+1).ordinalize} district"
  end
end

100.times do
  Legislator.seed do |l|
    l.body = 'Senate'
    l.first_name = Faker::Name.first_name
    l.last_name = Faker::Name.last_name
    l.state = 'MA'
    l.party = rand > 0.05 ? ['Democrat', 'Republican'].sample : 'Independent'
  end
end
