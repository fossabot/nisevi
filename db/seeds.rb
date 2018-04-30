# frozen_string_literal: true

Faker::Config.locale = 'en-US'
IMAGE = 'https://assets.imgix.net/examples/bluehat.jpg'

### USERS ###
# Admin user
puts "\n Start seeding."
puts "\n Creating admin:"
admin = User.new(
  first_name: 'Nicolas',
  last_name: 'Vidal',
  date_of_birth: Time.new,
  location: Faker::Address.country,
  presentation: Faker::Hacker.say_something_smart,
  email: 'admin@example.com',
  username: 'nisevi',
  password: 'admin12345',
  password_confirmation: 'admin12345',
  admin: true
)

# Deactivated confirmation email
admin.skip_confirmation!
admin.save!
print '.'
admin.images.create(path: Faker::File.file_name('path/to'), url: IMAGE, active: true)

puts "\n Creating normal users:"
100.times do
  # Generation of normal users (no admin users)
  password = Faker::Internet.password(10, 16)
  u = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    date_of_birth: Time.now,
    location: Faker::Pokemon.location,
    presentation: Faker::Hacker.say_something_smart,
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: password,
    password_confirmation: password
  )
  # Deactivated confirmation email
  # in order to avoid email limit
  u.skip_confirmation!
  u.save!
  u.images.create!(
    path: Faker::File.file_name('path/to'),
    url: IMAGE,
    active: true
  )
  print '.'
end

### PORTFOLIO ###
puts "\n Creating portfolios:"
(0...100).each do |n|
  portfolio = Portfolio.create!(
    user: admin,
    # Alternate hidden attribute between hidden=true and hidden=false
    hidden: n.even? ? true : false,
    client: Faker::Company.name,
    date_project: Time.now,
    description: Faker::Hacker.say_something_smart,
    content: Faker::Lorem.paragraph,
    title: Faker::Book.title,
    url_project: Faker::Internet.url
  )
  portfolio.images.create(
    path: Faker::File.file_name('path/to'),
    url: IMAGE,
    active: true
  )
  print '.'
end

### LINKS ###
puts "\n Creating links:"
github = Link.create!(social_media: 'github')
stack = Link.create!(social_media: 'stack-overflow')
google = Link.create!(social_media: 'google-plus')
twitter = Link.create!(social_media: 'twitter')
linkedin = Link.create!(social_media: 'linkedin')
upwork = Link.create!(social_media: 'upwork')

### USER LINKS ###
puts "\n Creating user links:"
admin.user_links.create!(link: github, url: 'https://github.com/nisevi')
admin.user_links.create!(link: stack, url: 'https://stackoverflow.com/users/2055252/nisevi')
admin.user_links.create!(link: google, url: 'https://plus.google.com/+NicolasSebastianVidal')
admin.user_links.create!(link: twitter, url: 'https://twitter.com/NicoSVidal')
admin.user_links.create!(link: linkedin, url: 'https://www.linkedin.com/in/nicolassebastianvidal')
admin.user_links.create!(link: upwork, url: 'https://www.upwork.com/fl/nisevi')

### SKILLS ###
puts "\n Creating skills:"
%w[mysql python php ruby rails mongodb].each do |skill|
  Skill.create!(superpower: skill)
  print '.'
end

### USER SKILLS ###
puts "\n Creating user skills:"
User.all.each do |user|
  UserSkill.create!(
    skill: Skill.all.sample,
    user: user,
    description: Faker::Hacker.say_something_smart,
    url: Faker::Internet.url
  )
  print '.'
end

### PORTFOLIO SKILLS ###
puts "\n Creating portfolio skills:"
Portfolio.all.each do |portfolio|
  PortfolioSkill.create!(
    skill: Skill.all.sample,
    portfolio: portfolio
  )
  print '.'
end

### SERVICES ###
puts "\n Creating services:"
20.times do
  service = Service.create!(
    user: admin,
    active: [true, false].sample,
    title: Faker::Name.title,
    description: Faker::Hacker.say_something_smart,
    content: Faker::Lorem.paragraph
  )
  service.images.create!(
    path: Faker::File.file_name('path/to'),
    url: IMAGE,
    active: true
  )
  print '.'
end

### PHONES ###
puts "\n Creating phones:"
10.times do
  Phone.create!(
    user: admin,
    country_code: Faker::Address.country_code,
    area_code: Faker::PhoneNumber.area_code,
    extension: Faker::PhoneNumber.extension,
    number: Faker::PhoneNumber.phone_number,
    notes: Faker::Hacker.say_something_smart
  )
  print '.'
end

### ADDRESSES ###
puts "\n Creating addresses:"
10.times do
  Address.create!(
    user: admin,
    city: Faker::Address.city,
    street_name: Faker::Address.street_name,
    street_number: Faker::Number.number(10),
    secondary_address: Faker::Address.secondary_address,
    building_number: Faker::Address.building_number,
    zip_code: Faker::Address.zip_code,
    time_zone: Faker::Address.time_zone,
    state: Faker::Address.state,
    state_abbr: Faker::Address.state_abbr,
    country: Faker::Address.country,
    country_code: Faker::Address.country_code,
    notes: Faker::Hacker.say_something_smart
  )
  print '.'
end

### LANGUAGES ###
puts "\n Creating languages:"
10.times do
  Language.create!(
    user: admin,
    name: Faker::App.name,
    description: Faker::Hacker.say_something_smart,
    url_language: Faker::Internet.url,
    obtained: Time.now
  )
  print '.'
end

### CATEGORIES ###
puts "\n Creating categories:"
%w[programming database front-end back-end algorithms mongodb].each do |cat|
  Category.create!(topic: cat)
  print '.'
end

### ARTICLES ###
puts "\n Creating articles:"
100.times do |n|
  title = Faker::Name.title
  article = Article.create!(
    user: admin,
    published: n.even? ? true : false,
    title: title,
    description: Faker::Hacker.say_something_smart,
    content: Faker::Lorem.paragraph,
    publication_date: 10.days.from_now
  )
  article.images.create!(
    path: Faker::File.file_name('path/to'),
    url: IMAGE,
    active: true
  )
  print '.'
end

### ARTICLE CATEGORIES ###
puts "\n Creating article categories:"
Article.all.each do |art|
  Category.all.shuffle[1..-1].each do |cat|
    ArticleCategory.create!(
      article: art,
      category: cat
    )
    print '.'
  end
end

### COMMENTS ###
puts "\n Creating comments:"
Article.all.each do |article|
  # create 10 comments per article
  10.times do |n|
    Comment.create!(
      article: article,
      user: n.even? ? admin : User.all.sample,
      content: Faker::Lorem.paragraph
    )
    print '.'
  end
end

### CONTACTS ###
puts "\n Creating contacts:"
100.times do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    message: Faker::Hacker.say_something_smart
  )
  print '.'
end

puts "\n Seeding finished."
