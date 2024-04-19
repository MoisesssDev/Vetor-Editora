class Evaluated < ApplicationRecord
  belongs_to :psychologist
  has_many :instruments_applied
  validates :name, :birthdate, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
end
