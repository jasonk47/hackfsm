class HomeController < ApplicationController

  def index
  end

  def timeline
    render layout: "timeline"
  end

end
