1000.times do
  Legislator.seed do |l|
    l.body = ApplicationHelper.legislative_bodies.sample
    l.first_name = Faker::Name.first_name
    l.last_name = Faker::Name.last_name
    l.state = ApplicationHelper.us_states.sample
  end
end
