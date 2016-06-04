class TalksController < ApplicationController
  def index
    @keynotes = Talk.keynotes
    @write = Talk.where_day("write")
    @speak = Talk.where_day("speak")
    @code = Talk.where_day("code")
    @career = Talk.where_day("career")
  end

  def alumna
    @talks = Talk.where(alumna_track: true).day_order
  end
end
