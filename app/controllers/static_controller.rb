class StaticController < ApplicationController
  def index
    render layout: 'conference_layout'
  end

  def cfp
    render layout: 'conference_layout'
  end

  def nominate
    render layout: 'conference_layout'
  end

  def tickets
    render layout: 'conference_layout'
  end
end
