class TalksController < ApplicationController
  def index
    @keynotes = Talk.keynotes
    @write = Talk.where_day("write").where(keynote: false)
    @speak = Talk.where_day("speak").where(keynote: false)
    @code = Talk.where_day("code").where(keynote: false)
    @career = Talk.where_day("career").where(keynote: false)
  end
end
