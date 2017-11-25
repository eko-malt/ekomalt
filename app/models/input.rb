class Input < ApplicationRecord
  belongs_to :provider
  validates :weightfact, presence: true
  validates :weightdoc, presence: true

end
