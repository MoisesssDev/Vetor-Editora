require 'rails_helper'

RSpec.describe InstrumentsApplied, type: :model do
  describe '#valid?' do
    context 'false' do
      it 'sem associação com instrument' do
        psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
        evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                                    birthdate: '01/01/1980')
        instrument_applied = evaluated.instruments_applied.new(evaluated:, status: :finished, result: 5)

        expect(instrument_applied).not_to be_valid
      end

      it 'sem associação com evaluated' do
        instrument = Instrument.create!(name: 'Teste de stress', description: 'teste para medir o nivel de stress')
        instrument_applied = InstrumentsApplied.new(instrument: instrument, status: :finished, result: 5)

        expect(instrument_applied).not_to be_valid
      end
    end
  end
end