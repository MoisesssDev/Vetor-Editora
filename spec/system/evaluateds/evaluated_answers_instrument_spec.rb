require 'rails_helper'

describe 'Avaliado responde instrumento' do
  it 'com sucesso' do
    psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')
    evaluated = psychologist.evaluateds.create!(name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com',
                                    birthdate: '01/01/1980')
    instrument = Instrument.create!(name: 'Instrumento 1', description: 'Descrição do instrumento 1')
    question = instrument.questions.create!(content: 'Pergunta 1')
    question.answers.create!(content: 'Resposta 1', value: 3)
    question.answers.create!(content: 'Resposta 2', value: 2)
    question.answers.create!(content: 'Resposta 3', value: 1)
    question.answers.create!(content: 'Resposta 4', value: 0)

    question = instrument.questions.create!(content: 'Pergunta 2')
    question.answers.create!(content: 'Resposta 1', value: 3)
    question.answers.create!(content: 'Resposta 2', value: 2)
    question.answers.create!(content: 'Resposta 3', value: 1)
    question.answers.create!(content: 'Resposta 4', value: 0)
    instruments_applied = instrument.instruments_applied.create!(evaluated: evaluated, status: :not_started)

    visit answer_instruments_applied_path(instruments_applied)
    
    within('#question_1') do
      choose 'Resposta 1'
    end

    within('#question_2') do
      choose 'Resposta 2'
    end

    click_on 'Próximo'

    expect(instruments_applied.reload.result).to eq(5)
    expect(instruments_applied.reload).to be_finished
    expect(page).to have_current_path(finished_message_instruments_applied_path(instruments_applied))
    expect(page).to have_content('Obrigado por responder o instrumento')
  
  end

end