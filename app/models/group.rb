class Group < ActiveRecord::Base

  belongs_to :group_header

  has_many :nodes

end
