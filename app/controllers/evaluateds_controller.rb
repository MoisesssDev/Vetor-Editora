class EvaluatedsController < ApplicationController
  before_action :authenticate_psychologist!
  before_action :set_psychologist, only: %i[new create]

  def new
    @evaluated = @psychologist.evaluateds.build
  end

  def create
    @evaluated = @psychologist.evaluateds.build(evaluated_params)

    if @evaluated.save
      redirect_to root_path, notice: 'Avaliado cadastrado com sucesso'
    else
      render :new
    end

  end

  def show
    @evaluated = Evaluated.find(params[:id])
  end

  private

  def set_psychologist
    @psychologist = current_psychologist
  end

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birthdate)
  end

end