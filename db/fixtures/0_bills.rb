250.times do
  Bill.seed do |b|
    b.body              = ApplicationHelper.legislative_bodies.sample
    b.description       = Faker::Lorem.paragraph
    b.number            = [['H', 'S'].sample, rand(9999)+1].join
    b.session           = rand(2009..2014)
    b.state             = 'MA'
    b.title             = Faker::Lorem.sentence(3, false, 16)
    b.citizen_sponsored = rand(100) < 10 ? true : false
  end
end

250.times do
  Bill.seed do |b|
    b.body              = ApplicationHelper.legislative_bodies.sample
    b.description       = Faker::Lorem.paragraph
    b.number            = [['H', 'S'].sample, rand(9999)+1].join
    b.reintroduces      = rand(1..100) if [true, false].sample
    b.session           = rand(2014..2017)
    b.state             = 'MA'
    b.title             = Faker::Lorem.sentence(3, false, 16)
    b.citizen_sponsored = rand(100) < 10 ? true : false
  end
end
