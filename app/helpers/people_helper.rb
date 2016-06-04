module PeopleHelper
  def speaker_talks(person)
    talks = []

    person.talks.each do |talk|
      talks << link_to(talk.title, "#{talks_path}##{talk.slug}")
    end

    talks.to_sentence.html_safe
  end
end
