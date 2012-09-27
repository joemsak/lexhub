require 'vcr_helper'
require 'lexhub'

describe "Read commits from a repo on github" do
  it "returns commits with their messages" do
    VCR.use_cassette('read commits from a repo') do
      repo   = Lexhub::Repo.new('joemsak', 'lexhub')
      commit = repo.commits.last

      commit.message.should == 'Initial commit'
    end
  end
end
