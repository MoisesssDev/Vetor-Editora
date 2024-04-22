class Evaluated < ApplicationRecord
  belongs_to :psychologist
  has_many :instruments_applied
  has_many :instruments, through: :instruments_applied
  validates :name, :birthdate, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }

  def match_verification_data?(data)
    name == data[:name] && cpf == data[:cpf] && email == data[:email] &&
    birthdate.to_date == data[:birthdate].to_date
  end

end
