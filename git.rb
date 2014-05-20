require "fileutils"
require "digest/md5"
require "tempfile"

class Git
  REPO_ROOT = File.expand_path("../repos", __FILE__)

  attr_reader :url

  def initialize(git_url)
    @url = git_url
    FileUtils.mkdir_p REPO_ROOT
  end

  def repo_dir
    hash = Digest::MD5.hexdigest(url)
    File.join(REPO_ROOT, hash[1,1], hash)
  end

  def clone
    FileUtils.mkdir_p repo_dir
    system(*%W(git clone #{url} #{repo_dir}))
  end

  def cd(&block)
    pwd = Dir.pwd
    Dir.chdir(repo_dir)
    block.call
  ensure
    Dir.chdir(pwd)
  end

  def fetch
    clone
    cd do
      system("git fetch --all")
    end
  end

  def checkout(branch)
    cd do
      system(*%W(git checkout -f origin/#{branch}))
    end
  end

  def commit(msg)
    cd do
      system(*%W(git commit -a -m #{msg}))
    end
  end

  def push(branch)
    cd do
      system(*%W(git push origin HEAD:#{branch}))
    end
  end
end
