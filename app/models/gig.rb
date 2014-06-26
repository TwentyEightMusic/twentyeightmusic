class Gig < ActiveRecord::Base
  validates :venue, presence: true
  validates :start_time, presence: true

  def self.upcoming_gigs(num)
    where("start_time >= ?", Time.now.midday).
      order("start_time asc").
      first(num)
  end
end
