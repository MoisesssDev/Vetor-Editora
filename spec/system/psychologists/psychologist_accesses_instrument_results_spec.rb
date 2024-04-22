require 'rails_helper'

describe 'Psicologo acessa instrumento' do
  it 'e ver o resultado' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
    instruments_applied = instrument.instruments_applied.create!(evaluated: evaluated, status: :finished, result: 5)

    login_as psychologist
    visit root_path
    click_on 'Fernando'
    click_on 'Instrumento 1'

    expect(page).to have_content 'Instrumento 1'
    expect(page).to have_content 'Descrição do instrumento 1'
    expect(page).to have_content 'Status: Finalizado'
    expect(page).to have_content 'Resultado'
    expect(page).to have_content '5'
  end

  it 'e ainda não possui o resultado' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
    instruments_applied = instrument.instruments_applied.create!(evaluated: evaluated, status: :not_started)

    login_as psychologist
    visit root_path
    click_on 'Fernando'
    click_on 'Instrumento 1'

    expect(page).to have_content 'Instrumento 1'
    expect(page).to have_content 'Descrição do instrumento 1'
    expect(page).to have_content 'Status: Não iniciado'
    expect(page).to have_content 'Resultado'
    expect(page).to have_content 'Ainda não possui resultado'
  end
  
end
