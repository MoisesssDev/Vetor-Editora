require 'rails_helper'

describe 'Psicologo cadastra avaliado' do

  it 'com sucesso' do
    psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')
    
    login_as psychologist
    visit root_path
    click_on 'Cadastrar avaliado'
    fill_in 'Nome', with: 'Jorge Matheus'
    fill_in 'Data de nascimento', with: '01/01/1980'
    fill_in 'CPF', with: '12345678910'
    fill_in 'E-mail', with: 'jorge@avaliado.com'
    click_on 'Cadastrar'

    expect(page).to have_current_path root_path
    expect(page).to have_content 'Avaliado cadastrado com sucesso'
    expect(Evaluated.count).to eq 1
    expect(Evaluated.last.name).to eq 'Jorge Matheus'
    expect(page).to have_content 'Jorge Matheus'
  end

  context 'sem sucesso' do
    it 'e não preenche os campos' do
      psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')
    
      login_as psychologist
      visit new_evaluated_path
      fill_in 'Nome', with: ''
      fill_in 'Data de nascimento', with: ''
      fill_in 'CPF', with: ''
      fill_in 'E-mail', with: ''
      click_on 'Cadastrar'

      expect(page).to have_content 'Não foi possível cadastrar o avaliado:'
      expect(page).to have_content 'Nome não pode ficar em branco'
      expect(page).to have_content 'Data de nascimento não pode ficar em branco'
      expect(page).to have_content 'CPF não pode ficar em branco'
      expect(page).to have_content 'E-mail não pode ficar em branco'
      expect(Evaluated.count).to eq 0
    end

    it 'e CPF já cadastrado' do
      psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')
      psychologist.evaluateds.create!(name: 'Jorge Matheus', cpf: '12345678910', email: 'jorge@gmail.com', 
                                     birthdate: '01/01/1980')

      login_as psychologist
      visit new_evaluated_path
      fill_in 'Nome', with: 'Fernando Henrique'
      fill_in 'Data de nascimento', with: '04/11/1980'
      fill_in 'CPF', with: '12345678910'
      fill_in 'E-mail', with: 'fernando@gmail.com'
      click_on 'Cadastrar'

      expect(page).to have_content 'Não foi possível cadastrar o avaliado:'
      expect(page).to have_content 'CPF já está em uso'
      expect(Evaluated.last.name).not_to eq 'Fernando Henrique'
    end

    it 'e CPF inválido' do
      psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')
    
      login_as psychologist
      visit root_path
      click_on 'Cadastrar avaliado'
      fill_in 'Nome', with: 'Jorge Matheus'
      fill_in 'Data de nascimento', with: '01/01/1980'
      fill_in 'CPF', with: '1234567891011'
      fill_in 'E-mail', with: 'jorge@avaliado.com'
      click_on 'Cadastrar'

      expect(page).to have_content 'Não foi possível cadastrar o avaliado:'
      expect(page).to have_content 'CPF não possui o tamanho esperado (11 caracteres)'
      expect(Evaluated.count).to eq 0
    end


    it 'e e-mail já cadastrado' do
      psychologist = Psychologist.create!(email: 'fernando@psicologo.com', password: '123456')
      psychologist.evaluateds.create!(name: 'Jorge Matheus', cpf: '12345678910', email: 'jorge@gmail.com', 
                                     birthdate: '01/01/1980')

      login_as psychologist
      visit new_evaluated_path
      fill_in 'Nome', with: 'Fernando Henrique'
      fill_in 'Data de nascimento', with: '04/11/1980'
      fill_in 'CPF', with: '12345678911'
      fill_in 'E-mail', with: 'jorge@gmail.com'
      click_on 'Cadastrar'

      expect(page).to have_content 'Não foi possível cadastrar o avaliado:'
      expect(page).to have_content 'E-mail já está em uso'
      expect(Evaluated.last.name).not_to eq 'Fernando Henrique'
    end
    
  end
  

end