class TalksController < ApplicationController
  def index
    # @talks = Talk.all
    @keynotes = Talk.keynotes
    @both_talks = Talk.where(first_year_track: true).where(alumna_track: true).where(keynote: false)
    @alumna_talks = Talk.where(alumna_track: true).where(keynote: false)
    @first_year_talks = Talk.where(first_year_track: true).where(keynote: false)
  end
end
