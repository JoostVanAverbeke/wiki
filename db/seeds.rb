# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100000.times do
  author = Author.create(surname: Faker::Name.last_name,
                firstname: Faker::Name.first_name,
                title: Faker::Name.initials(character_count = 3),
                birthdate: Faker::Date.birthday(min_age = 18, max_age = 104),
                sex: rand(1..2)
  )
  number_of_articles = rand(1..500)
  number_of_articles.times do |law_article_number|
    law = "Fifi\'s law #{law_article_number}"
    law_article_attributes = {
        law: law,
        article_attributes: {
            subject: "#{law} subject",
            description: "This article describes law #{law}",
            author_id: author.id
        }
    }
    law_article_service = LawArticleService.new(LawArticle.new(law_article_attributes))
    law_article = law_article_service.make_descriptive
    law_article.article.save
  end
end
