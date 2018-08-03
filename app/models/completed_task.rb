class CompletedTask < ApplicationRecord

  validates_presence_of :title, :created_by, :room

end