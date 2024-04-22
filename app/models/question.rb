class Question < ApplicationRecord
  belongs_to :instrument
  has_many :answers
end
