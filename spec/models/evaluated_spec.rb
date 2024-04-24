require 'rails_helper'

RSpec.describe Evaluated, type: :model do
  describe '#valid?' do
    context 'false' do
      it 'sem nome' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        evaluated = psychologist.evaluateds.new(name: '', cpf: '12345678901', 
                                                            email: 'fulano@gmail.com', birthdate: Date.today)

        expect(evaluated.valid?).to be false
        expect(evaluated.errors).to include :name
      end

      it 'sem CPF' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        evaluated = psychologist.evaluateds.new(name: 'Fulano', cpf: '', 
                                                            email: 'fulano@gmail.com', birthdate: Date.today)

        expect(evaluated.valid?).to be false
        expect(evaluated.errors).to include :cpf
      end

      it 'sem e-mail' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        evaluated = psychologist.evaluateds.new(name: 'Fulano', cpf: '12345678901', 
                                                            email: '', birthdate: Date.today)

        expect(evaluated.valid?).to be false
        expect(evaluated.errors).to include :email
      end

      it 'sem data de nascimento' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        evaluated = psychologist.evaluateds.new(name: 'Fulano', cpf: '12345678901', 
                                                            email: 'fulano@gmail.com', birthdate: '')

        expect(evaluated.valid?).to be false
        expect(evaluated.errors).to include :birthdate
      end

      it 'com CPF duplicado' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        existing_evaluated = psychologist.evaluateds.create!(name: 'Fulano', cpf: '12345678901', 
                                                            email: 'fulano@gmail.com', birthdate: Date.today)

        evaluated = psychologist.evaluateds.new(name: 'Roberto', cpf: '12345678901', 
                                                email: 'roberto@gmail.com', birthdate: Date.today)

        expect(evaluated.valid?).to be false
        expect(evaluated.errors).to include :cpf
      end

      it 'com CPF com menos de 11 caracteres' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        evaluated = psychologist.evaluateds.new(name: 'Roberto', cpf: '1234', 
                                                email: 'roberto@gmail.com', birthdate: Date.today)

        expect(evaluated.valid?).to be false
        expect(evaluated.errors).to include :cpf
      end

      it 'com CPF com mais de 11 caracteres' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        evaluated = psychologist.evaluateds.new(name: 'Roberto', cpf: '123456789011', 
                                                email: 'roberto@gmail.com', birthdate: Date.today)

        expect(evaluated.valid?).to be false
        expect(evaluated.errors).to include :cpf
      end
    end

    context 'true' do
      it 'com todos os atributos preenchidos corretamente' do
        psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')

        evaluated = psychologist.evaluateds.new(name: 'Fulano', cpf: '12345678901', 
                                                            email: 'fulano@gmail.com', birthdate: Date.today)

        expect(evaluated.valid?).to be true
      end
    end
  end

  describe '#match_verification_data?' do
    it 'true' do
      psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')
      evaluated = psychologist.evaluateds.new(name: 'Fulano', cpf: '12345678901', 
                                              email: 'fulano@gmail.com', birthdate: Date.today)

      data = { name: 'Fulano', cpf: '12345678901', email: 'fulano@gmail.com', birthdate: Date.today }

      expect(evaluated.match_verification_data?(data)).to be true
    end
  end
end