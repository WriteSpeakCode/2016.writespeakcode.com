module TalksHelper
  def talk_speakers(talk)
    speakers = []

    talk.people.each do |person|
      speakers << link_to(person.name, "#{speakers_path}##{person.slug}")
    end

    speakers.to_sentence.html_safe
  end

  def talk_theme_text(talk)
    day_key = "talks.#{talk.day}"
    track_key = track_key(talk)
    track_text = talk_track(talk)

    [
      t("#{day_key}.theme.#{track_key}"),
      track_text,
    ].compact.join(" | ")
  end

  def talk_day_text(talk)
    day_key = "talks.#{talk.day}"

    [
      t("#{day_key}.day"),
      talk.start_time.try(:strftime, "%I:%M %p")
    ].compact.join(" | ")
  end

  def talk_track(talk)
    t("tracks.#{track_key(talk)}")
  end

  def track_key(talk)
    return "all" if talk.all_tracks?
    return "alumna" if talk.alumna_only?
    return "first"
  end
end
