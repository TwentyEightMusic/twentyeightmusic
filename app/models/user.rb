class User < ActiveRecord::Base
  ADMINS = [
    "kenyonj@gmail.com",
    "eddiegood@gmail.com",
    "gwmurphy@gmail.com",
    "dbuss1805@gmail.com",
    "kyler6733@gmail.com"
  ]

  def admin?
    ADMINS.include?(email)
  end
end
