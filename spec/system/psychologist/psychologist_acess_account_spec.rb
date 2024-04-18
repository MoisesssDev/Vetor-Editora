require 'rails_helper'

describe 'Psicologo acessa a plataforma' do
  it 'e é autenticado com sucesso' do
    visit root_path
    click_on 'Entrar como Psicólogo'

    fill_in 'Email', with: 'usuario@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).to have_content 'Login efetuado com sucesso.'
    within '#navbar' do
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'usuario@email.com'
    end
  end
  
end
