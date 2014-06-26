class ApiKey < ActiveRecord::Base
  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(18)
    while ApiKey.exists?(token: token)
      self.token = SecureRandom.hex(18)
    end
  end
end
