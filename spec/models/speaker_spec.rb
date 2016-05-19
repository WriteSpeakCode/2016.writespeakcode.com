require 'rails_helper'

describe Speaker do
  it "loads all speakers with files" do
    speaker_count = Dir[File.join(Speaker.root_path, '*.yml')].count { |file| File.file?(file) }
    expect(Speaker.all.count).to eq(speaker_count)
  end

  describe "#twitter_url" do
    it "returns url if twitter handle" do
      subject = Speaker.new({ twitter: "testtweet" })

      expect(subject.twitter_url).to eq("http://twitter.com/testtweet")
    end

    it "returns nil if no twitter handle" do
      subject = Speaker.new

      expect(subject.twitter_url).to be_nil
    end
  end

  describe "#github_url" do
    it "returns url if github handle" do
      subject = Speaker.new({ github: "tester" })

      expect(subject.github_url).to eq("http://github.com/tester")
    end

    it "returns nil if no github handle" do
      subject = Speaker.new

      expect(subject.github_url).to be_nil
    end
  end

  describe "#social_info" do
    it "returns a hash with social links" do
      subject = Speaker.new({
        twitter: 'yo',
        github: 'yo',
        linkedin: 'yo',
        website: 'yo'
      })

      expect(subject.social_info.keys).to include(
        :twitter,
        :github,
        :linkedin,
        :link
      )
    end

    it "does not include a key if there is not value for that link" do
      subject = Speaker.new({twitter: 'yoyo', github: 'yoyoyo'})

      expect(subject.social_info.keys).to_not include(
        :linkedin,
        :link
      )
    end
  end
end
