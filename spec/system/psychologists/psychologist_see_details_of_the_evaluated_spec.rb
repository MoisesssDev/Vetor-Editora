require 'rails_helper'

describe 'Psicologo visualiza detalhes do avaliado' do

  it 'com sucesso' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
    instrument.instruments_applied.create!(evaluated: evaluated, status: :not_started)
            
    login_as psychologist
    visit root_path
    click_on 'Fernando'

    expect(page).to have_content 'Nome: Fernando'
    expect(page).to have_content 'CPF: 12345678901'
    expect(page).to have_content 'E-mail: fernando@paciente.com'
    expect(page).to have_content 'Data de nascimento: 01/01/1980'
    expect(page).to have_content 'Instrumentos aplicados:'
    expect(page).to have_content 'Instrumento 1'
    expect(page).to have_content 'Descrição do instrumento 1'
    expect(page).to have_content 'Status: Não iniciado'
  end

end