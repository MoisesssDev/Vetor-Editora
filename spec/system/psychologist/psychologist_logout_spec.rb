require 'rails_helper'

describe 'Psicologo faz logout' do
  it 'com sucesso' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')

    login_as psychologist
    visit root_path
    click_on 'Sair'

    expect(page).to have_content 'Entrar como Psicólogo'
    within 'nav' do
      expect(page).not_to have_content psychologist.email
      expect(page).not_to have_button 'Sair'
    end
    expect(page).to have_content 'Logout efetuado com sucesso.'
  end
end