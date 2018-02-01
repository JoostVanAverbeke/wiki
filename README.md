# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Application Model Description


### Entity Relation Diagram

How to generate the ERD diagram?

    rake erd


[wiki ERD](https://github.com/JoostVanAverbeke/wiki/blob/master/erd.pdf)

### Relations

#### The belongs_to Relation
 
 An Article belongs to an Author
 
 A Comment belongs to an Article
 
 A Chapter belongs to an Article
 
 A Section belongs to a Chapter
 
 A Section belongs to a Section
 
 A Text belongs to a Section
 
#### The has_many Relation
 
 An Author has many Articles
 
 An Article has many Comments
  
 An Article has many Chapters
  
 A Chapter has many Sections
 
 A Section has many Texts
  
#### The has_and_belongs_to_many (many to many) Relation

 An Article has many Tags
 
 A Tag has many Articles
 
#### The Super - Sub type Relation
 
 A ScientificArticle is an (has one) Article
 
 A LawArticle is an (has one) Article

#### Self Joins
 
 A Section has many Subsections (Sections)


## Document the Your Rails API with swagger
 See [https://www.sitepoint.com/do-the-right-thing-and-document-your-rails-api-with-swagger/](https://www.sitepoint.com/do-the-right-thing-and-document-your-rails-api-with-swagger/)

###  Generating and Viewing Documentation
The following Rake task will generate the docs for the controllers/actions that have been configured:

    rake swagger:docs



