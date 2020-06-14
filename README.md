# Strive
Strive is our gamified preformance review system to help our team members Strive.
Strive replaces our current 360-degree performance review system by integrating essential elemements of the 360-degree system and gamifing it to deliver feedback by a biweekly basis so that teammates can Strive faster.
We decided to make it an open source under a MIT License, 
so that you can use Strive to implement a better preformance review system for your team.
Strive uses a badging system to reconize and reward team members.The badges are given every two weeks,
they are rewarded under four categories Solver, Reliable, Venturian and Expert.

**Solver** adheres to analitical skills

**Reliable** means Able to deliver on time and teammates can count on them 

**Venturian** adheres to Venturit culture: Being Honest, Encouraging, Transparent, Fun, etc

**Expert**  means the team member is becoming a subject matter expert

### Badges
In our system we have four types of badges: Bronze, Silver, Gold and Platinum

**Bronze**: If you recive a bronze that means you meet expectaions,and each bronze is worth 5$ USD of rewards you can cash in, if one gets 3 bronze they will get elevated to a Silver badge

**Silver**: If you recive a silver that means you exceed expectations and each silver is worth 20$ USD of rewards you can cash in, if one gets 3 silver they will get elevated to a Gold badge 

**Gold**: If you recive a gold that means you strongly exceed expectations and each gold is worth 75$ USD of rewards you can cash in, if one gets 2 gold they will get elevated to a Platinum badge 

**Platinum**: If you recive a platinum that means you are a superb teammate and each platinum is worth 200$ USD of rewards you can cash in, the Platinum badge is the highest level in our badging system

### Who can Award Badges?

**Teammates** Any teammate can award a bronze badge to any other teammate for being: Reliable, A Solver and a Venturian at the end of the Biweekly period

**Supervisor** Any supervisor can award a bronze and silver badge to any teammate for being: Reliable, A Solver,an Expert
 and a Venturian at the end of the Biweekly period

**Project Managers** Any Project Manager can award a bronze and silver badge to any teammate for being: Reliable, A Solver,an Expert and a Venturian at the end of the Biweekly period

**Client Managers** Any Client Manager can award a bronze and silver badge to any teammate for being: Reliable, A Solver,an Expert and a Venturian at the end of the Biweekly period

**Directors** Any Director can award a bronze and silver badge to any teammate for being:a n Expert and a Venturian at the end of the Biweekly period


Note: These Badges are valid until the annual preformance review and it will get reset for the new year

### Setup Information

We have used Ruby on Rails to develop the Strive application

* Ruby version
 2.7.0 
* Rails version
 6.0.3.1
* System dependencies
We have used many Gems such as devise, aws-sdk-s3",haml-rails,bootstrap,jquery-rails,mini_racer,cancancan and BDD driven tests using capybara, cucumber-rails, factory_bot_rails.

For all dependencies see Gemfile

* Configuration
```
brew install nodejs
brew install yarn
bundle install
yarn add bootstrap jquery popper.js
```

* Database creation

```
rake db:migrate
```
* Database initialization
```
rake db:seed
```
* How to run the test suite
```
cucumber -s
```
