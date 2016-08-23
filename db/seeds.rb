IMAGE="https://assets.imgix.net/examples/bluehat.jpg"

### USERS ###
# Admin user
admin = User.new(
  first_name: "Nicolas",
  last_name: "Vidal",
  date_of_birth: Time.new,
  location: "Germany",
  presentation:
  "
  Lorem ipsum dolor sit amet, ei quod aeterno qualisque
  usu, eu sea autem erant. Cu dictas liberavisse sit,
  vix euismod consulatu et, saepe consul ex mei. Alia
  meliore est te, cu cum unum nonumes. Ut est sint
  appareat, recusabo ocurreret eam ne. Per autem option
  ad, adhuc albucius consequat ex pri.
  ",
  image_url: IMAGE,
  image_path: "",
  email: "admin@example.com",
  username: "username_admin",
  password: "admin1234",
  password_confirmation: "admin1234",
  admin: true
)
# Deactivated confirmation email
admin.skip_confirmation!
admin.save!

(0...100).each do |n|
  # Generation of normal users (no admin users)
  u = User.new(
    first_name: "FirstNameUser#{n}",
    last_name: "LastNameUser#{n}",
    date_of_birth: Time.new,
    location: "Location#{n}",
    presentation:
    "
    #{n}Lorem ipsum dolor sit amet, ei quod aeterno qualisque
    usu, eu sea autem erant. Cu dictas liberavisse sit,
    vix euismod consulatu et, saepe consul ex mei. Alia
    meliore est te, cu cum unum nonumes. Ut est sint
    appareat, recusabo ocurreret eam ne. Per autem option
    ad, adhuc albucius consequat ex pri.
    ",
    image_url: IMAGE,
    image_path: "",
    email: "example#{n}@email.com",
    username: "username#{n}",
    password: "username#{n}",
    password_confirmation: "username#{n}",
  )
  # Deactivated confirmation email
  # in order to avoid email limit
  u.skip_confirmation!
  u.save!
end

### PORTFOLIO ###
(0...100).each do |n|
  Portfolio.create(
    {
      user: admin,
      # Alternate hidden attribute between hidden=true and hidden=false
      hidden: n%2==0 ? true : false,
      client: "Brainyatom #{1}",
      date_project: Time.now,
      description:
        "
        Teenormous.com#{n} was born in the summer of 2008 to
        solve one of the world's most important problems:
        How to find the perfect t-shirt.
        ",
      title: "Teenormous#{n}",
      image_url: IMAGE,
      image_path: "",
      url_project: "http://teenormous.com",
    },
  )
end

Portfolio.all.each do |portfolio|
  PortfolioSkill.create([
    {portfolio: portfolio, name: "Ruby"},
    {portfolio: portfolio, name: "Ruby on Rails"},
    {portfolio: portfolio, name: "Sidekiq"},
    {portfolio: portfolio, name: "MailChimp"},
  ])
end

### LINKS ###
link_github = Link.create(name: "github")
link_stackoverflow = Link.create(name: "stack-overflow")
link_googleplus = Link.create(name: "google-plus")
link_linkedin = Link.create(name: "twitter")
link_twitter = Link.create(name: "linkedin")
link_freelancer = Link.create(name: "freelancer")

### USER LINKS ###
user_links = UserLink.create([
  {
   user: admin,
   name: "github",
   link: link_github,
   url: "https://github.com/nisevi"
  },
  {
   user: admin,
   name: "stack-overflow",
   link: link_stackoverflow,
   url: "http://stackoverflow.com/cv/nisevi"
  },
  {
   user: admin,
   name: "google-plus",
   link: link_googleplus,
   url: "https://plus.google.com/+Nicol%C3%A1sSebasti%C3%A1nVidal"
  },
  {
   user: admin,
   name: "linkedin",
   link: link_linkedin,
   url: "https://de.linkedin.com/in/nicolassebastianvidal"
  },
  {
   user: admin,
   name: "twitter",
   link: link_twitter,
   url: "https://twitter.com/NicoSVidal"
  },
  {
   user: admin,
   name: "freelancer",
   link: link_freelancer,
   url: "http://www.upwork.com/fl/nisevi"
  }
])

### SERVICES ###
(0...100).each do |n|
  Service.create(
    user: admin,
    hidden: n%2==0 ? false : true,
    title: "Service#{n}",
    image_url: IMAGE,
    image_path: "",
    description:"Service#{n} description."
  )
end
service_web_scraping = Service.create(
  user: admin,
  hidden: false,
  title: "Web Scraping",
  image_url: IMAGE,
  image_path: "",
  description:
    "
    Using vanguard technologies for extracting large
    amounts of data from websites, for further analysis
    or for product estimations.
    "
)
service_web_development = Service.create(
  user: admin,
  hidden: false,
  title: "Web Development",
  image_url: IMAGE,
  image_path: "",
  description:
    "
    From a simple website to a complex business.
    I will provide you with the best solutions,
    to satisfy your users and customers as well.
    "
)
service_web_seo = Service.create(
  user: admin,
  hidden: false,
  title: "SEO Content",
  image_url: IMAGE,
  image_path: "",
  description:
    "
    Are you producing quality content? Search engine
    optimization on your website will give you the
    best possible ranking.
    "
)
service_web_mail = Service.create(
  user: admin,
  hidden: false,
  title: "Mail Campaigns",
  image_url: IMAGE,
  image_path: "",
  description:
    "
    Create your new campaign, start building your
    audience, give that personalized touch that
    you are looking for your bussines.
    "
)

### PHONE NUMBERS ###
phone_numbers = PhoneNumber.create([
  {
    user: admin,
    phone_number: "1234567890",
    description: "home"
  },
  {
    user: admin,
    phone_number: "0987654321",
    description: "mobile"
  },
  {
    user: admin,
    phone_number: "6789012345",
    description: "work"
  },
  {
    user: admin,
    phone_number: "1234509876",
    description: "others"
  }
])

### LANGUAGES ###
languages = Language.create([
  {
    user: admin,
    name: "English",
    description: "proficiency",
    url_language: ""
  },
  {
    user: admin,
    name: "Spanish",
    description: "native",
    url_language: ""
  },
  {
    user: admin,
    name: "German",
    description: "initial",
    url_language: ""
  },
])

### ARTICLES ###
(0...100).each do |n|
  Article.create(
    user: admin,
    published: n%2==0 ? true : false,
    title: "Title number #{n}.",
    description: "This is the description of the article number #{n}.",
    content:
      "
      Lorem ipsum dolor sit amet, ei quod aeterno qualisque
      usu, eu sea autem erant. Cu dictas liberavisse sit,
      vix euismod consulatu et, saepe consul ex mei. Alia
      meliore est te, cu cum unum nonumes. Ut est sint
      appareat, recusabo ocurreret eam ne. Per autem option
      ad, adhuc albucius consequat ex pri.
      ",
    image_url: IMAGE,
    image_path: "",
    publication_date: Time.now
  )
end

Article.all.each do |article|
  # create 10 comments per article
  (0...10).each do |n|
    Comment.create(
      article: article,
      user: n%2==0 ? admin : User.all.shuffle[0],
      content:
        "
        Comment number #{n}. Lorem ipsum dolor sit amet,
        ei quod aeterno qualisque usu, eu sea autem erant.
        Cu dictas liberavisse sit, vix euismod consulatu
        et, saepe consul ex mei. Alia meliore est te,
        cu cum unum nonumes. Ut est sint appareat,
        recusabo ocurreret eam ne. Per autem option
        ad, adhuc albucius consequat ex pri.
        "
    )
  end
end
