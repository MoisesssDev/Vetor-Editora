require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe '#valid?' do
    context 'false' do
      it 'sem associação com question' do
        answer = Answer.new(content: 'Azul')

        expect(answer).not_to be_valid
      end
    end
  end
end