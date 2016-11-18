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
  username: 'username_admin',
  password: 'admin1234',
  password_confirmation: 'admin1234',
  admin: true
)
# Deactivated confirmation email
admin.skip_confirmation!
admin.save!
admin.images.create(
  path: Faker::File.file_name('path/to'),
  url: IMAGE,
  active: true
)

puts "\n Creating normal users:"
(0...100).each do
  # Generation of normal users (no admin users)
  password = Faker::Internet.password
  u = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    date_of_birth: Time.new,
    location: Faker::Pokemon.location,
    presentation: Faker::Hacker.say_something_smart,
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: password,
    password_confirmation: password,
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
    hidden: n%2==0 ? true : false,
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
%w(github stack-overflow google-plus twitter linkedin freelancer).each do |media|
  Link.create!(social_media: media)
  print '.'
end

### USER LINKS ###
puts "\n Creating user links:"
Link.all.each do |link|
  UserLink.create!(
    user: admin,
    link: link,
    url: Faker::Internet.url
  )
  print '.'
end

### SKILLS ###
puts "\n Creating skills:"
%w(mysql python php ruby rails mongodb).each do |skill|
  Skill.create!(superpower: skill)
  print '.'
end

### USER SKILLS ###
puts "\n Creating user skills:"
User.all.each do |user|
  UserSkill.create!(
    skill: Skill.all.shuffle[0],
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
    skill: Skill.all.shuffle[0],
    portfolio: portfolio
  )
  print '.'
end

### SERVICES ###
puts "\n Creating services:"
(0...20).each do |n|
  service = Service.create!(
    user: admin,
    active: [true,false].shuffle.first,
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
(0...10).each do
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
(0...10).each do
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
(0...10).each do
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
%w(programming database front-end back-end algorithms mongodb).each do |cat|
  Category.create!(topic: cat)
  print '.'
end

### ARTICLES ###
puts "\n Creating articles:"
(0...100).each do |n|
	title = Faker::Name.title
  article = Article.create!(
    user: admin,
    published: n%2==0 ? true : false,
    title: title,
    description: Faker::Hacker.say_something_smart,
    content: Faker::Lorem.paragraph,
    publication_date: Time.now
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
  (0...10).each do |n|
    Comment.create!(
      article: article,
      user: n%2==0 ? admin : User.all.shuffle[0],
      content: Faker::Lorem.paragraph,
    )
    print '.'
  end
end

### CONTACTS ###
puts "\n Creating contacts:"
(0...100).each do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    message: Faker::Hacker.say_something_smart
  )
  print '.'
end

puts "\n Seeding finished."
