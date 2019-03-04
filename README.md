Ruby-v 2.5.1

How to Run: 
-bundle install
-bundle exec rails db:setup 
-bundle exec rails c 
-FetchSpellsJob.perform_now (this will take a minute, it pulls all the data here) 
-quit 
-bundle exec rails s
-open https://localhost:3000
