require 'rails_helper'

describe 'Psicologo acessa a plataforma' do
  it 'e é autenticado com sucesso' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    
    visit root_path
    click_on 'Entrar como Psicólogo'
    fill_in 'E-mail', with: 'luis@psicologo.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).to have_content 'Login efetuado com sucesso.'
    within 'nav' do
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'luis@psicologo.com'
    end
  end
  
end
