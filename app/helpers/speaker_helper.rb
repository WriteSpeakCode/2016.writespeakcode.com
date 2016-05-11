module SpeakerHelper
  def talk_class(talk_name_full)
    talk_name = talk_name_full.downcase

    return "mentor" if talk_name.include?("mentor")
    return "panel" if talk_name.include?("panel")

    "full_talk"
  end
end
