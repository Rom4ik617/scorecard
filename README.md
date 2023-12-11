<h1> Top Contributors app </h1>

## Information

"Top Contributors app" is a program for tracking who did the most work each week.

![app photo](https://private-user-images.githubusercontent.com/101750999/289504086-e211f201-faa0-43e4-810a-8eef0c07cac9.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE3MDIyOTA1NTMsIm5iZiI6MTcwMjI5MDI1MywicGF0aCI6Ii8xMDE3NTA5OTkvMjg5NTA0MDg2LWUyMTFmMjAxLWZhYTAtNDNlNC04MTBhLThlZWYwYzA3Y2FjOS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBSVdOSllBWDRDU1ZFSDUzQSUyRjIwMjMxMjExJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDIzMTIxMVQxMDI0MTNaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1kMDEwZDhjZjc1NmE4ZTNhNmM0NzU3ZWE3NDM5ZWI5YmMwM2Q1YmRkYWIzMGJiZTMyZmJlNTcwM2EyZTczMTc1JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.rRPGwEdH_54PKFvPZH-9aykzZqDGATVCGPgmgMpJGLc)

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
