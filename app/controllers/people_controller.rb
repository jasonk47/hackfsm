class PeopleController < ApplicationController

  def index
    @important = Person.where(important: true)
    @people = Person.all
  end

  def show
  end

end
