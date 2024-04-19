class Instrument < ApplicationRecord
  has_many :instruments_applied
  has_many :evaluateds, through: :instruments_applied
end
