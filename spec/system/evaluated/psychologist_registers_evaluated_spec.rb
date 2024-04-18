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

end