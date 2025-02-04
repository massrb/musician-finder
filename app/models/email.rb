class Email < ApplicationRecord
	has_many :mailings
  has_many :profiles, through: :mailings
end
