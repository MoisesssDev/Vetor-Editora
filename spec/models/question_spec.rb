require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '#valid?' do
    context 'false' do
      it 'sem associação com o instrumento' do
        question = Question.new(content: 'Qual é a sua cor favorita?')

        expect(question).not_to be_valid
      end
    end
  end
end