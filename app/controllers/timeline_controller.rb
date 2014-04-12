require 'net/http'
require 'nokogiri'

class TimelineController < ApplicationController
  include TimelineHelper

  def show
    id = params[:id]

    @fields_to_check = {
      "Creator"             => "fsmCreator",
      "Date"                => "fsmDateCreated",
      "Resource Type"       => "fsmTypeOfResource",
      "Note"                => "fsmNote",
      "Related Title"       => "fsmRelatedTitle",
      "Archive Identifier"  => "fsmIdentifier",
      "Related Identifier"  => "fsmRelatedIdentifier",
      "Archive Location"    => "fsmPhysicalLocation"
    }

    @info = get_hash_from_id(id)
    @content = get_data_from_id(id)
    if @content.kind_of? String # this is xml
      parsed_doc = Nokogiri::XML(@content)
      root_children = parsed_doc.root.children
      text = nil
      for child in root_children
        if child.element? and child.name.downcase == 'text'
          text = child
        end
      end
      for child in text.children.children
        if child.element? and child.name.downcase == 'div1'
          child.name = 'div'
          for subchild in child.children
            puts subchild.name
            if subchild.element? and subchild.name.downcase == 'head'
              subchild.name = 'h3'
            end
            if subchild.element? and subchild.name.downcase == 'p'
              for subsubchild in subchild.children
                if subsubchild.element? and subsubchild.name.downcase == 'emph'
                  subchild.name = 'strong'
                end
              end
            end
          end
        end
      end
      @content = text.to_s.html_safe
    end
  end

end
