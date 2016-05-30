class StaticController < ApplicationController
  def index
    render layout: "splash"
  end
end
