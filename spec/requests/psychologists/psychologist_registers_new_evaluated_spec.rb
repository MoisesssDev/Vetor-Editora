require 'rails_helper'

describe 'Psicologo registra novo avaliado' do
  context 'e não está autenticado' do
    it 'e não consegue acessar a página' do
      get new_evaluated_path

      expect(response).to redirect_to new_psychologist_session_path
    end

    it 'e não consegue registrar um novo avaliado' do
      evaluated_params = { evaluated: { name: 'Fernando', cpf: '12345678901', email: 'fernando@gmail.com',
                                        birthdate: '01/01/1980' } }

      post evaluateds_path, params: evaluated_params

      expect(response).to redirect_to new_psychologist_session_path
    end
  end
end