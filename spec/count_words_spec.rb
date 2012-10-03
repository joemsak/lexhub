require 'vcr_helper'
require 'lexhub'

describe 'Counting words in all commit messages' do
  let(:repo) { Lexhub::Repo.new('joemsak', 'lexhub') }

  it "counts the words" do
    VCR.use_cassette('collect all the words') do
      repo.words['initial'].should == { :count => 1 }
    end
  end

  it "returns the most used word" do
    VCR.use_cassette('find the most used word') do
      repo.most_used_words.should include('refactor')
    end
  end

  it "does not count excluded words" do
    VCR.use_cassette('exclude words') do
      words = repo.words.keys

      Lexhub.configuration.excluded_words.each do |w|
        words.should_not include(w)
      end
    end
  end
end
