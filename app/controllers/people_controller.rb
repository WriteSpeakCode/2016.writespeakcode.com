class PeopleController < ApplicationController
  def index
    @people = Person.all.displayable.decorate
  end
end
