admin = User.create(
          first_name: "Nicolas",
          last_name: "Vidal",
          location: "location",
          presentation: "",
          image: ENV["IMAGE_SEEDS"],
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
                           client: "Brainyatom",
                           description:
                             "
                             Teenormous.com was born in the summer of 2008 to
                             solve one of the world's most important problems:
                             How to find the perfect t-shirt.
                             ",
                           title: "Teenormous",
                           url_project: "http://teenormous.com",
                         },
                       )
portfolio_everycostume = Portfolio.create(
                           {
                             user: admin,
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
                             url_project: "http://everycostume.com",
                           },
                         )
portfolio_trendypurse = Portfolio.create(
                          {
                            user: admin,
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

### PORTFOLIO IMAGES ###
portfolio_teenormous_image = Image.create(
                               url: ENV["IMAGE_SEEDS"],
                               path: "",
                               header: true,
                               portfolio: portfolio_teenormous
                             )
portfolio_everycostome_image = Image.create(
                                 url: ENV["IMAGE_SEEDS"],
                                 path: "",
                                 header: true,
                                 portfolio: portfolio_everycostume
                               )
portfolio_trendypurse_image = Image.create(
                                url: ENV["IMAGE_SEEDS"],
                                path: "",
                                header: true,
                                portfolio: portfolio_trendypurse
                              )

### LINKS ###
link_github = Link.create(name: "github")
link_stackoverflow = Link.create(name: "stack-overflow")
link_googleplus = Link.create(name: "google-plus")
link_linkedin = Link.create(name: "twitter")
link_twitter = Link.create(name: "linkedin")

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
               }
             ])

### SERVICES ###
service_web_scraping = Service.create(
                        user: admin,
                        hidden: false,
                        title: "Web Scraping",
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
                    description:
                      "
                      Create your new campaign, start building your
                      audience, give that personalized touch that
                      you are looking for your bussines.
                      "
                  )

### SERVICE IMAGES ###
service_web_scraping_image = Image.create(
                               url: ENV["IMAGE_SEEDS"],
                               path: "",
                               header: true,
                               service: service_web_scraping
                             )
service_web_development_image = Image.create(
                                  url: ENV["IMAGE_SEEDS"],
                                  path: "",
                                  header: true,
                                  service: service_web_development
                                )
service_web_seo_image = Image.create(
                          url: ENV["IMAGE_SEEDS"],
                          path: "",
                          header: true,
                          service: service_web_seo
                        )
service_web_mail_image = Image.create(
                           url: ENV["IMAGE_SEEDS"],
                           path: "",
                           header: true,
                           service: service_web_mail
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
first_article = Article.create(
                  user: admin,
                  published: true,
                  title: "Contraction and expansion of Internet.",
                  text:
                    "
                    Lorem ipsum dolor sit amet, ei quod aeterno qualisque
                    usu, eu sea autem erant. Cu dictas liberavisse sit,
                    vix euismod consulatu et, saepe consul ex mei. Alia
                    meliore est te, cu cum unum nonumes. Ut est sint
                    appareat, recusabo ocurreret eam ne. Per autem option
                    ad, adhuc albucius consequat ex pri.
                    ",
                  date_article: Time.now
                )
second_article = Article.create(
                   user: admin,
                   published: true,
                   title: "Contraction and expansion of Internet.",
                   text:
                     "
                     Lorem ipsum dolor sit amet, ei quod aeterno qualisque
                     usu, eu sea autem erant. Cu dictas liberavisse sit,
                     vix euismod consulatu et, saepe consul ex mei. Alia
                     meliore est te, cu cum unum nonumes. Ut est sint
                     appareat, recusabo ocurreret eam ne. Per autem option
                     ad, adhuc albucius consequat ex pri.
                     ",
                   date_article: Time.now
                 )
third_article = Article.create(
                  user: admin,
                  published: true,
                  title: "Contraction and expansion of Internet.",
                  text:
                    "
                    Lorem ipsum dolor sit amet, ei quod aeterno qualisque
                    usu, eu sea autem erant. Cu dictas liberavisse sit,
                    vix euismod consulatu et, saepe consul ex mei. Alia
                    meliore est te, cu cum unum nonumes. Ut est sint
                    appareat, recusabo ocurreret eam ne. Per autem option
                    ad, adhuc albucius consequat ex pri.
                    ",
                  date_article: Time.now
                )

### ARTICLE IMAGES ###
first_article_image = Image.create(
                        url: ENV["IMAGE_SEEDS"],
                        path: "",
                        header: true,
                        article: first_article
                      )
second_article_image = Image.create(
                         url: ENV["IMAGE_SEEDS"],
                         path: "",
                         header: true,
                         article: second_article
                       )
third_article_image = Image.create(
                        url: ENV["IMAGE_SEEDS"],
                        path: "",
                        header: true,
                        article: third_article
                      )
