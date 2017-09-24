class User < ApplicationRecord
  has_many :jobs
  has_many :takes
  has_many :bids

  enum user_type: [:applicant, :recruiter]
end
