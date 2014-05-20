require "stringio"

class Lint
  attr_reader :git

  def initialize(git)
    @git = git
  end

  def lint(branch)
    git.fetch
    git.checkout(branch)
    tmp = Tempfile.new("linter-")
    git.cd do
      system('bundle exec rubocop -a', :out => tmp)
    end
    tmp.rewind
    stdout = tmp.read
    git.commit(stdout)
    git.push(branch)
  end
end
