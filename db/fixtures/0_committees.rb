100.times do
  Committee.seed do |l|
    l.body = ApplicationHelper.committee_bodies.sample
    l.name = Faker::Company.catch_phrase
    l.state = 'MA'
  end
end
