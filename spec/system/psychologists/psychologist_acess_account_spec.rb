require 'rails_helper'

describe 'Psicologo acessa a plataforma' do
  it 'e é autenticado com sucesso' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    
    visit root_path
    click_on 'Fazer login'
    fill_in 'E-mail', with: 'luis@psicologo.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).to have_content 'Login efetuado com sucesso.'
    within 'nav' do
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'luis@psicologo.com'
    end
  end

  it 'e não é autenticado' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')

    visit new_psychologist_session_path
    fill_in 'E-mail', with: 'jorginho@gmail.com'
    fill_in 'Senha', with: '328902'
    click_on 'Entrar'

    expect(page).to have_content 'E-mail ou senha inválidos.'
  end
  
end
