require 'rails_helper'

describe 'Avaliado é redirecionado para o sistema' do

  it 'e ver formulario de confirmação' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
    instruments_applied = instrument.instruments_applied.create!(evaluated: evaluated, status: :not_started)
    
    visit instruments_applied_url(instruments_applied)

    expect(page).to have_field 'Nome'
    expect(page).to have_field 'CPF'
    expect(page).to have_field 'E-mail'
    expect(page).to have_field 'Data de nascimento'
    expect(page).to have_button 'Próximo'
  end

  it 'e preenche o formulario de confirmação com sucesso' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
    instruments_applied = instrument.instruments_applied.create!(evaluated: evaluated, status: :not_started)
    
    visit instruments_applied_url(instruments_applied)
    fill_in 'Nome', with: 'Fernando'
    fill_in 'CPF', with: '12345678901'
    fill_in 'E-mail', with: 'fernando@paciente.com'
    fill_in 'Data de nascimento', with: '01/01/1980'
    click_on 'Próximo'

    expect(page).to have_current_path(answer_instrument_path(instrument))
    expect(page).to have_content('Agora você pode acessar o sistema')
  end

  it 'e preenche o formulario de confirmação com dados incorretos' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
    instruments_applied = instrument.instruments_applied.create!(evaluated: evaluated, status: :not_started)

    visit instruments_applied_url(instruments_applied)
    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'Data de nascimento', with: ''
    click_on 'Próximo'

    expect(page).to have_current_path(instruments_applied_path(instruments_applied))
    expect(page).to have_content('Dados incorretos. Tente novamente!')
  end
end