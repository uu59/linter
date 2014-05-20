# -- coding: utf-8

require "bundler"
Bundler.require(:default, :development)
require "json"

post "*" do
  payload = JSON.parse(request.body.read)
  branch = payload["pull_request"]["head"]["ref"]
  repo_url = payload["pull_request"]["head"]["repo"]["ssh_url"]
  git = Git.new(repo_url)
  lint = Lint.new(git)
  lint.lint(branch)
end
