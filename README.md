Very roughly Continuous Linter

# Auto rubocop fired by GitHub pull request event

1. `bundle install`
2. `bundle exec ruby ./app.rb`
3. `ngrok 4567` and grab forwarding URL
4. Set the URL to webhook on GitHub with pull_request event
5. https://github.com/uu59test/foobar/pull/2

Prepare to access to GitHub repo by SSH key (deploy key).

Or using Docker.

1. `docker build -t linter .`
2. `./start.bash`
