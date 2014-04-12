require 'net/http'

class TimelineController < ApplicationController
  include TimelineHelper

  def show
    id = params[:id]

    @fields_to_check = {
      "Creator"       => "fsmCreator",
      "Date"          => "fsmDateCreated",
      "Resource Type" => "fsmTypeOfResource",
      "Note"          => "fsmNote",
      "Related Title" => "fsmRelatedTitle",
      "Archive Identifier"  => "fsmIdentifier",
      "Related Identifier"  => "fsmRelatedIdentifier",
      "Archive Location"    => "fsmPhysicalLocation"
    }

    @info = get_hash_from_id(id)
    @content = get_data_from_id(id)
  end

end
