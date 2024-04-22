psychologist = Psychologist.create!(email: 'luis@psicologo.com', password: '123456')

evaluateds_data = [
  { name: 'Fernando', cpf: '12345678901', email: 'fernando@paciente.com', birthdate: '1980-01-01' },
  { name: 'João', cpf: '12345678902', email: 'joao@paciente.com', birthdate: '1981-02-02' },
  { name: 'Maria', cpf: '12345678903', email: 'maria@paciente.com', birthdate: '1982-03-03' }
]

evaluateds_data.each do |data|
  psychologist.evaluateds.create!(data)
end

instrument1 = Instrument.create!(name: 'Inventário de Personalidade NEO-PI-R', description: 'Este teste avalia os Cinco Grandes Fatores da personalidade: Neuroticismo, Extroversão, Abertura à Experiência, Amabilidade e Conscienciosidade.')

instrument2 = Instrument.create!(name: 'Escala Beck de Depressão', description: 'Este teste é utilizado para medir a gravidade dos sintomas de depressão em indivíduos.')

question1_1 = instrument1.questions.create!(content: 'Eu sou uma pessoa nervosa e ansiosa.')
question1_2 = instrument1.questions.create!(content: 'Eu geralmente me sinto calmo e tranquilo.')
question1_3 = instrument1.questions.create!(content: 'Eu gosto de conhecer novas pessoas e fazer novos amigos.')
question1_4 = instrument1.questions.create!(content: 'Eu me considero uma pessoa teimosa e inflexível.')
question1_5 = instrument1.questions.create!(content: 'Eu me sinto confortável em situações sociais.')

question1_1.answers.create!(content: 'Completamente verdadeiro para mim', value: 3)
question1_1.answers.create!(content: 'Mais ou menos verdadeiro para mim', value: 2)
question1_1.answers.create!(content: 'Um pouco verdadeiro para mim', value: 1)
question1_1.answers.create!(content: 'Não verdadeiro para mim', value: 0)

question1_2.answers.create!(content: 'Completamente verdadeiro para mim', value: 0)
question1_2.answers.create!(content: 'Mais ou menos verdadeiro para mim', value: 1)
question1_2.answers.create!(content: 'Um pouco verdadeiro para mim', value: 2)
question1_2.answers.create!(content: 'Não verdadeiro para mim', value: 3)

question1_3.answers.create!(content: 'Completamente verdadeiro para mim', value: 0)
question1_3.answers.create!(content: 'Mais ou menos verdadeiro para mim', value: 1)
question1_3.answers.create!(content: 'Um pouco verdadeiro para mim', value: 2)
question1_3.answers.create!(content: 'Não verdadeiro para mim', value: 3)

question1_4.answers.create!(content: 'Completamente verdadeiro para mim', value: 3)
question1_4.answers.create!(content: 'Mais ou menos verdadeiro para mim', value: 2)
question1_4.answers.create!(content: 'Um pouco verdadeiro para mim', value: 1)
question1_4.answers.create!(content: 'Não verdadeiro para mim', value: 0)

question1_5.answers.create!(content: 'Completamente verdadeiro para mim', value: 0)
question1_5.answers.create!(content: 'Mais ou menos verdadeiro para mim', value: 1)
question1_5.answers.create!(content: 'Um pouco verdadeiro para mim', value: 2)
question1_5.answers.create!(content: 'Não verdadeiro para mim', value: 3)


question2_1 = instrument2.questions.create!(content: 'Eu me sinto triste ou desanimado.')
question2_2 = instrument2.questions.create!(content: 'Eu tenho dificuldade para dormir ou durmo demais.')
question2_3 = instrument2.questions.create!(content: 'Eu tenho pouco interesse ou prazer em fazer as coisas.')
question2_4 = instrument2.questions.create!(content: 'Eu me sinto cansado ou com pouca energia.')
question2_5 = instrument2.questions.create!(content: 'Eu me sinto mal comigo mesmo, ou que sou um fracasso ou que decepcionei a mim mesmo ou a minha família.')


question2_1.answers.create!(content: 'Nunca', value: 0)
question2_1.answers.create!(content: 'Às vezes', value: 1)
question2_1.answers.create!(content: 'Quase sempre', value: 2)
question2_1.answers.create!(content: 'Sempre', value: 3)

question2_2.answers.create!(content: 'Nunca', value: 0)
question2_2.answers.create!(content: 'Às vezes', value: 1)
question2_2.answers.create!(content: 'Quase sempre', value: 2)
question2_2.answers.create!(content: 'Sempre', value: 3)

question2_3.answers.create!(content: 'Nunca', value: 0)
question2_3.answers.create!(content: 'Às vezes', value: 1)
question2_3.answers.create!(content: 'Quase sempre', value: 2)
question2_3.answers.create!(content: 'Sempre', value: 3)

question2_4.answers.create!(content: 'Nunca', value: 0)
question2_4.answers.create!(content: 'Às vezes', value: 1)
question2_4.answers.create!(content: 'Quase sempre', value: 2)
question2_4.answers.create!(content: 'Sempre', value: 3)

question2_5.answers.create!(content: 'Nunca', value: 0)
question2_5.answers.create!(content: 'Às vezes', value: 1)
question2_5.answers.create!(content: 'Quase sempre', value: 2)
question2_5.answers.create!(content: 'Sempre', value: 3)

