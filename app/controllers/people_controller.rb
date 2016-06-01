class PeopleController < ApplicationController
  def index
    @people = Person.all.displayable.decorate
  end

  def speakers
    @people = Person.speakers_and_mentors.displayable.decorate
    render 'index'
  end
end
