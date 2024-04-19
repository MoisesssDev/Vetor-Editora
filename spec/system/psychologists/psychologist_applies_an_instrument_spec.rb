require 'rails_helper'

describe 'Psicologo aplica um instrumento' do

  it 'com sucesso' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated_1 = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', 
                                                email: 'fernando@avaliado.com', birthdate: '01/01/1980')
    evaluated_2 = psychologist.evaluateds.create!(name: 'Carlos', cpf: '12345678911', 
                                                email: 'carlos@avaliado.com', birthdate: '05/11/1980')
    instrument = Instrument.create!(name: 'EPQ', description: 'Escala de Personalidade')

    login_as psychologist
    visit root_path
    click_on 'Ver instrumentos'
    click_on 'Aplicar instrumento'
    check 'Fernando'
    check 'Carlos'
    click_on 'Aplicar'

    expect(instrument.evaluateds).to include evaluated_1
    expect(instrument.evaluateds).to include evaluated_2
    expect(page).to have_content 'Instrumento aplicado com sucesso'
    expect(page).to have_current_path root_path
  end

  context 'sem sucesso' do
    it 'não seleciona avaliados' do
      psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
      evaluated_1 = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', 
                                                  email: 'fernando@avaliado.com', birthdate: '01/01/1980')
      instrument = Instrument.create!(name: 'EPQ', description: 'Escala de Personalidade')

      login_as psychologist
      visit select_evaluateds_instrument_path(instrument)
      click_on 'Aplicar'

      expect(instrument.evaluateds).not_to include evaluated_1
      expect(page).to have_content 'Nenhum avaliado selecionado'
    end
  end
  

end