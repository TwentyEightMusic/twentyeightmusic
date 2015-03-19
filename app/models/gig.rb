class Gig < ActiveRecord::Base
  has_one :bootleg, dependent: :destroy
  has_many :tracks, through: :bootleg

  validates :venue, presence: true
  validates :start_time, presence: true

  def self.upcoming_gigs(num)
    where("start_time >= ?", Time.now.midday).
      order("start_time asc").
      first(num)
  end

  def self.sorted_in_the_past
    where("start_time <= ?", Time.now.midday).
      order("start_time asc")
  end

  def listing_date
    "#{venue} #{start_time.strftime('%a, %b%e')}"
  end

  def date
    start_time.strftime('%a, %b %e %Y')
  end

  def friendly_start_time
    start_time.strftime('%a, %b%e @ %l%p')
  end
end
