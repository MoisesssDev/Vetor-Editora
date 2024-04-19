require 'rails_helper'

describe 'Psicologo visualiza detalhes do avaliado' do

  it 'e não está autenticado' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')

    get evaluated_path(evaluated)

    expect(response).to redirect_to new_psychologist_session_path
  end

  it 'e está autenticado' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')

    login_as psychologist
    get evaluated_path(evaluated)

    expect(response).to have_http_status(:ok)
    expect(response.body).to include('Fernando')
    expect(response.body).to include('12345678901')
    expect(response.body).to include('fernando@paciente.com')
    expect(response.body).to include('01/01/1980')
  end
end