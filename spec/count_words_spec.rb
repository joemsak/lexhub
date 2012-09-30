require 'vcr_helper'
require 'lexhub'

describe 'Counting words in all commit messages' do
  it "counts the words" do
    VCR.use_cassette('collect all the words') do
      repo = Lexhub::Repo.new('joemsak', 'lexhub')
      repo.words.count.should == 73
    end
  end
end
