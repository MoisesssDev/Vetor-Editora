require 'rails_helper'

describe 'Psicologo aplica um instrumento' do

  context 'e não está autenticado' do
    it 'e não consegue acessar a página' do
      instrument = Instrument.create!(name: 'EPQ', description: 'Escala de Personalidade')

      get select_evaluateds_instrument_path(instrument)

      expect(response).to redirect_to new_psychologist_session_path
    end

    it 'e não consegue aplicar um instrumento' do
      instrument = Instrument.create!(name: 'EPQ', description: 'Escala de Personalidade')
      evaluateds_ids = { evaluateds_ids: [ 1, 2] }

      post apply_instrument_path(instrument), params: evaluateds_ids

      expect(response).to redirect_to new_psychologist_session_path
    end
  end

end