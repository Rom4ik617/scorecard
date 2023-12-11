<h1> Top Contributors app </h1>

## Information

"Top Contributors app" is a program for tracking who did the most work each week.

## Features

This application allows you:

* Display a weekly scorecard that highlights the top contributors to a GitHub repository.
* Utilize the GitHub API to fetch events related to pull requests, comments, and reviews on a specified repository.
* Assign points to different types of GitHub events, such as pull requests, pull request comments, and pull request reviews.
* Identify and display the top contributors based on the total points they have accumulated in a given week.
* Store weekly contributor information in the database, including their total points for each week.

## Getting started

You need to have the following tools.

- Ruby 3.1.3
- Rails 7.1.2
- Git

##### 1. Check out the repository

```bash
git clone https://github.com/Rom4ik617/scorecard.git
cd scorecard
```

##### 2. Create and setup the database and bundle

Run the following commands to create and setup the database, and application libraries.

```ruby
rails db:create
rails db:migrate
bundle install
```

##### 3. Start the Rails server

You can start the rails server with the following command.

```ruby
rails s
```

Now you can go to http://localhost:3000
