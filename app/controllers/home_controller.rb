class HomeController < ApplicationController

  include TimelineHelper

  def index
  end

  def timeline
    @timeline_info = timeline_info
    puts @timeline_info.to_s
    render layout: "timeline"
  end

end
