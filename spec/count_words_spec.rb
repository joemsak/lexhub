require 'vcr_helper'
require 'lexhub'

describe 'Counting words in all commit messages' do
  it "counts the words" do
    VCR.use_cassette('collect all the words') do
      repo = Lexhub::Repo.new('joemsak', 'lexhub')

      repo.words['initial'].should == { :count => 1 }
    end
  end

  it "returns the most used word" do
    VCR.use_cassette('find the most used word') do
      repo = Lexhub::Repo.new('joemsak', 'lexhub')

      repo.most_used_words.should include('the')
    end
  end
end
