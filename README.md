# Open Source Learning Project

Share learning resources and build curricula!  

[Deployed App](https://peaceful-waters-19907.herokuapp.com/)

## Using OSLP

1. Sign up for an account
2. Share learning resources that you found helpful
3. Build a curriculum based on these resources, providing some structured learning to other users
4. Keep track of your progress as you go through a curriculum's resources
5. Search and discover existing resources and curricula from other users. Search by...
  i. Search terms
  ii. Categories
  iii. Tags
6. Provide feedback on resources and curricula:
  i. Approval rating
  ii. Difficulty
  iii. Completion Time
  iv. Comments

## Running OSLP

1. Fork this repo
2. Clone it to your machine
3. Bundle install all gems `$ bundle install`
4. Install Elasticsearch [instructions](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-elasticsearch-on-ubuntu-14-04]
5. Setup database
  i. `$ rails db:create`
  ii. `$ rails db:migrate`
  iii. `$ rails db:seed`
6. Start a rails server `$ rails s` and enjoy!

## Technical Overview

1. Used Elasticsearch for multi-threaded and asynchronous searching
2. Created complex ActiveRecord queries to determine resource completion
3. Developed polymorphic models to maintain abstraction in codebase
4. Emphasized modularity via the thorough use of partials
