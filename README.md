Setup application in development:

bundle install 
rake db:create db:migrate db:seed 
rails s 


Unit test:
rake db:migrate RAILS_ENV='test'
# to run all specs.
rspec spec/ 

# to run specific spec file  
rspec spec/models/customer_spec.rb


App hosted at: https://online-barber-shop.herokuapp.com/