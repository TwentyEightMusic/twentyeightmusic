class Bootleg < ActiveRecord::Base
  belongs_to :gig
  has_many :tracks, dependent: :destroy

  validates :gig, uniqueness: true
end
