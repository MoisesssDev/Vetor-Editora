require 'rails_helper'

describe 'Psicologo acessa pagina do resultado' do
  it 'e nẫo está autenticado' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Teste de stress', description: 'teste para medir o nivel de stress')
    instrument_applied = evaluated.instruments_applied.create!(instrument: instrument, status: :finished, result: 5)

    get instruments_applied_path(instrument_applied)

    expect(response.body).not_to include 'Teste de stress'
    expect(response.body).not_to include 'teste para medir o nivel de stress'
    expect(response.body).not_to include 'Status: Finalizado'
    expect(response.body).not_to include 'Resultado: 5'
  end
end