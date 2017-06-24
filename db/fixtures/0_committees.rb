ApplicationHelper.committee_bodies.each do |b|
  15.times do
    Committee.seed do |l|
      l.body = b
      l.name = Faker::Company.catch_phrase
      l.state = 'MA'
    end
  end
end
