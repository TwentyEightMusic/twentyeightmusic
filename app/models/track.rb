class Track < ActiveRecord::Base
  belongs_to :bootleg

  validates :name, presence: true
  validates :filepicker_url, presence:true
end
