class TalksController < ApplicationController
  def index
    @keynotes = Talk.keynotes
    @write = Talk.where_day("write")
    @speak = Talk.where_day("speak")
    @code = Talk.where_day("code")
    @career = Talk.where_day("career")
  end
end
