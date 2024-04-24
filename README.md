
## Rebase Labs

**Tech Stack**
- Docker
- Ruby
- Rails
- HTML
- CSS


### Premissa
A premissa principal deste app é um sistema que permita que psicólogos possam disponibilizar instrumentos psicológicos para que avaliados possam realizá-los. O sistema possui dois tipos de acesso: Psicólogo e Avaliado.

**Psicólogo:**
Consegue aplicar um instrumento ao avaliado, cadastrar novo avaliado, ver detalhes do avaliado assim como os instrumentos que foram aplicados e o resultado desse instrumento.

**Avaliado:**
É notificado via e-mail, com o link para acessar o instrumento que foi aplicado. Após clicar no link ele precisa fazer a verificação dos dados, depois de verificado ele tem acesso ao instrumento e pode responde-lo.


### Pré-requisitos

Certifique-se de ter o Docker e Docker Compose instalado na sua máquina.

### Configuração

1. Clone este repositório:
```bash
    git clone git@github.com:MoisesssDev/Vetor-Editora.git
```
2. Navegue até o diretório do projeto:
```bash
    cd Vetor-Editora
```
3. Para iniciar o servidor, execute o script que roda a imagem no Docker:
```bash
    docker-compose up --build
```

**Observações:**
- Se você precisar executar comandos adicionais, como migrações de banco de dados ou seeds, você pode executá-los dentro do contêiner do Docker. Por exemplo:

Para migrações
```bash
    docker-compose exec web bundle exec rails db:migrate
```
ou

Para seeds.
```bash
    docker-compose exec web bundle exec rails db:seeds
```


### Testes
Para rodar os testes execute o seguinte comando:
```bash
    docker compose run --rm -e "RAILS_ENV=test" web bundle exec rspec
```

### Links utéis
- [Design do projeto no Figma](https://www.figma.com/file/VdapSbqbqnIQ1TSDROaKYf/Vetor-Editora?type=design&node-id=0%3A1&mode=design&t=CO61VDTX7SWf5ohp-1)
- [Diagrama do banco de dados](https://dbdiagram.io/d/Vetor-Editora-662047c603593b6b6145fea7)


## Melhorias

- Melhorar UI/UX e responsividade.
- Criar um Job para ser responsavel pelo envio do e-mail.

