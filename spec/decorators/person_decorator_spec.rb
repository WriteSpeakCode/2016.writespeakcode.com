require 'rails_helper'

describe PersonDecorator do
  describe "#twitter_url" do
    it "returns url if twitter handle" do
      subject = Person.new({ twitter: "testtweet" }).decorate

      expect(subject.twitter_url).to eq("http://twitter.com/testtweet")
    end

    it "returns nil if no twitter handle" do
      subject = Person.new.decorate

      expect(subject.twitter_url).to be_nil
    end
  end

  describe "#github_url" do
    it "returns url if github handle" do
      subject = Person.new({ github: "tester" }).decorate

      expect(subject.github_url).to eq("http://github.com/tester")
    end

    it "returns nil if no github handle" do
      subject = Person.new.decorate

      expect(subject.github_url).to be_nil
    end
  end

  describe "#social_info" do
    it "returns a hash with social links" do
      subject = Person.new({
        twitter: 'yo',
        github: 'yo',
        linkedin: 'yo',
        website: 'yo'
      }).decorate

      expect(subject.social_info.keys).to include(
        :twitter,
        :github,
        :linkedin,
        :link
      )
    end

    it "does not include a key if there is not value for that link" do
      subject = Person.new({twitter: 'yoyo', github: 'yoyoyo'}).decorate

      expect(subject.social_info.keys).to_not include(
        :linkedin,
        :link
      )
    end
  end

  describe "#title" do
    it "returns job title and company" do
      subject = Person.new(
        job_title: "Developer",
        company: "ValleyWoo"
      ).decorate

      expect(subject.title).to eq("Developer, ValleyWoo")
    end

    it "return only job title if no company" do
      subject = Person.new(job_title: "Developer").decorate

      expect(subject.title).to eq("Developer")
    end

    it "returns only company if no title" do
      subject = Person.new(company: "ValleyWoo").decorate

      expect(subject.title).to eq("ValleyWoo")
    end

    it "returns empty string if neither job title or company" do
      subject = Person.new.decorate

      expect(subject.title).to be_empty
    end
  end
end
