admin = User.create(
          first_name: "Nicolas",
          last_name: "Vidal",
          date_of_birth: Time.new(1987,03,10),
          location: "Germany",
          presentation:
          "
          I am Nicolas Sebastian Vidal, a twenty five year old designer from NY. I have
          graduated with a Bachelor degree of Graphic &amp; Web Design, from
          the University of Peiraias. I have a passion for creating challenging,
          intuitive and beautiful products. My design process is very hands-on
          and visual.Creating is not just a job for me, it's a passion.
          ",
          image_url: ENV["IMAGE_SEEDS"],
          image_path: "",
          email: ENV["USERNAME_MAILER"],
          username: ENV["ADMIN_USERNAME"],
          password: ENV["ADMIN_PASSWORD"],
          password_confirmation: ENV["ADMIN_PASSWORD"],
          admin: true
        )

### PORTFOLIO ###
portfolio_teenormous = Portfolio.create(
                         {
                           user: admin,
                           hidden: false,
                           client: "Brainyatom",
                           description:
                             "
                             Teenormous.com was born in the summer of 2008 to
                             solve one of the world's most important problems:
                             How to find the perfect t-shirt.
                             ",
                           title: "Teenormous",
                           image_url: ENV["IMAGE_SEEDS"],
                           image_path: "",
                           url_project: "http://teenormous.com",
                         },
                       )
portfolio_everycostume = Portfolio.create(
                           {
                             user: admin,
                             hidden: false,
                             client: "Brainyatom",
                             description:
                               "
                               EveryCostume.com scours the internet looking for
                               the best costumes from the coolest costume sites
                               on the net. They catalog and index them all in
                               one place.The results you get from a EveryCostume.com
                               search come from all over the net and they are
                               costumes you can actually buy online.
                               ",
                             title: "Everycostume",
                             image_url: ENV["IMAGE_SEEDS"],
                             image_path: "",
                             url_project: "http://everycostume.com",
                           },
                         )
portfolio_trendypurse = Portfolio.create(
                          {
                            user: admin,
                            hidden: false,
                            client: "Brainyatom",
                            description:
                              "
                              The Trendy Purse is the place to shop for the best deals
                              on the most popular ladies purses and handbags. When
                              browsing their site, you'll find the largest selection
                              of purses for sale online. They do all the hard work
                              by searching the internet for quality handbags so that
                              you can have a positive shopping experience and buy
                              with confidence.
                              ",
                            title: "Trendypurse",
                            image_url: ENV["IMAGE_SEEDS"],
                            image_path: "",
                            url_project: "http://trendypurse.com",
                          }
                        )

portfolio_sills = PortfolioSkill.create([
                    {portfolio: portfolio_teenormous, name: "Ruby"},
                    {portfolio: portfolio_teenormous, name: "Ruby on Rails"},
                    {portfolio: portfolio_teenormous, name: "Sidekiq"},
                    {portfolio: portfolio_teenormous, name: "MailChimp"},

                    {portfolio: portfolio_everycostume, name: "Ruby"},
                    {portfolio: portfolio_everycostume, name: "Ruby on Rails"},
                    {portfolio: portfolio_everycostume, name: "Sidekiq"},

                    {portfolio: portfolio_trendypurse, name: "Ruby"},
                    {portfolio: portfolio_trendypurse, name: "Ruby on Rails"},
                    {portfolio: portfolio_trendypurse, name: "Sidekiq"},
                  ])

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
service_web_scraping = Service.create(
                        user: admin,
                        hidden: false,
                        title: "Web Scraping",
                        image_url: ENV["IMAGE_SEEDS"],
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
                            image_url: ENV["IMAGE_SEEDS"],
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
                    image_url: ENV["IMAGE_SEEDS"],
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
                    image_url: ENV["IMAGE_SEEDS"],
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
    published: true,
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
    image_url: ENV["IMAGE_SEEDS"],
    image_path: "",
    publication_date: Time.now
  )
end

Article.all.each do |article|
  # create 10 comments per article
  (0...10).each do |n|
    Comment.create(
      article: article,
      user: admin,
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
