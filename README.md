# Open Source Learning Project

Share learning resources and build curricula!

[Deployed App](https://whispering-atoll-54342.herokuapp.com/resources)

## Using OSLP

1. Sign up for an account
2. Share learning resources that you found helpful
3. Build a curriculum based on these resources, providing some structured learning to other users
4. Keep track of your progress as you go through a curriculum's resources
5. Search and discover existing resources and curricula from other users. Search by...
  1. Search terms
  2. Categories
  3. Tags
6. Provide feedback on resources and curricula:
  1. Approval rating
  2. Difficulty
  3. Completion Time
  4. Comments

## Running OSLP

1. Fork this repo
2. Clone it to your machine
3. Bundle install all gems `$ bundle install`
4. Install Elasticsearch ([instructions](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-elasticsearch-on-ubuntu-14-04))
5. Setup database
  1. `$ rails db:create`
  2. `$ rails db:migrate`
  3. `$ rails db:seed`
6. Start a rails server `$ rails s` and enjoy!

## Technical Overview

1. Used Elasticsearch for multi-threaded and asynchronous searching
2. Created complex ActiveRecord queries to determine resource completion
3. Developed polymorphic models to maintain abstraction in codebase
4. Emphasized modularity via the thorough use of partials
