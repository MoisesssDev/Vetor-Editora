require 'rails_helper'

describe 'Psicologo cria conta' do
  it 'com sucesso' do
    visit root_path
    click_on 'Fazer login'
    click_on 'Criar conta'
    fill_in 'E-mail', with: 'luis@psicologo.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmação de senha', with: '123456'
    click_on 'Criar conta'

    expect(page).to have_content 'Bem vindo! Conta criada com sucesso.'
    expect(Psychologist.last.email).to eq('luis@psicologo.com')
  end

  context 'sem sucesso' do
    it 'porque todos os campos são obrigatórios' do
      visit new_psychologist_registration_path
      fill_in 'E-mail', with: ''
      fill_in 'Senha', with: ''
      fill_in 'Confirmação de senha', with: ''
      click_on 'Criar conta'
  
      expect(page).to have_content 'E-mail não pode ficar em branco'
      expect(page).to have_content 'Senha não pode ficar em branco'
    end

    it 'porque a senha deve ser igual a confirmação' do
      visit new_psychologist_registration_path
      fill_in 'E-mail', with: 'luis@psicologo.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: 'luis123'
      click_on 'Criar conta'
  
      expect(page).to have_content 'Confirmação de senha não é igual a Senha'
    end

    it 'porque email já cadastrado' do
      psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
  
      visit new_psychologist_registration_path
      fill_in 'E-mail', with: 'luis@psicologo.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: '123456'
      click_on 'Criar conta'
  
      expect(page).to have_content 'E-mail já está em uso'
    end
  end
  
end