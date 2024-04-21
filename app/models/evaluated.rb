class Evaluated < ApplicationRecord
  belongs_to :psychologist
  has_many :instruments_applied
  has_many :instruments, through: :instruments_applied
  validates :name, :birthdate, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }

  def match_verification_data?(data)
    name == data[:name] && cpf == data[:cpf] && email == data[:email] && formatted_birthdate == data[:birthdate]
  end

  def formatted_birthdate
    birthdate.strftime('%d/%m/%Y')
  end
end
