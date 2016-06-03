module TalksHelper
  def talk_date(day)
    case day
      when "write"
        return "June 15"
      when "speak"
        return "June 16"
      when "code"
        return "June 17"
      when "career"
        return "June 18"
      else
        return "TBD"
    end
  end

  def to_hour
    self.start_time.to_formatted_s
  end
end
