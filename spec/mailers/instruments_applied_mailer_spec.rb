require 'rails_helper'

describe 'Envio de e-mail para o avaliado' do

  it 'com sucesso' do
  psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
  evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@avaliado.com',
                                              birthdate: '01/01/1980')
  instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
  instrument_applied = instrument.instruments_applied.create!(evaluated: evaluated, status: :not_started)
  
  mail = InstrumentsAppliedMailer.notify(evaluated, instrument_applied, instrument)

  expect(mail.subject).to eq 'Você tem um novo instrumento para responder'
  expect(mail.to).to eq ['fernando@avaliado.com']
  expect(mail.body.encoded).to include 'Olá, Fernando!'
  expect(mail.body.encoded).to include 'Você recebeu um novo instrumento para ser avaliado:'
  expect(mail.body.encoded).to include 'Instrumento 1'
  expect(mail.body.encoded).to include 'Descrição do instrumento 1'
  expect(mail.body.encoded).to include 'Para iniciar a avaliação, acesse o link abaixo:'
  link = "http://localhost:3000/instruments_applied/#{instrument_applied.id}"
  expect(mail.body.encoded).to include link

  end

end