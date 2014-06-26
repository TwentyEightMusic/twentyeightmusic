class Gig < ActiveRecord::Base
  validates :venue, presence: true
  validates :start_time, presence: true

  def self.upcoming_gigs(num)
    upcoming.sorted.first(num)
  end

  private

  def self.upcoming
    where("start_time >= ?", Time.now.midday)
  end

  def self.sorted
    order("start_time asc")
  end
end
