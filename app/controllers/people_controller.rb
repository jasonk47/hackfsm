class PeopleController < ApplicationController

  include TimelineHelper

  def index
    @important = Person.order(count: :desc).limit(14)
    @people = Person.all.order(count: :desc)
  end

  def show
    @person = Person.find_by_slug(params[:id])
    if @person.nil?
      redirect_to root_url
    end
    @docs = adv_search(@person.name, {})["response"]["docs"]
  end

end
