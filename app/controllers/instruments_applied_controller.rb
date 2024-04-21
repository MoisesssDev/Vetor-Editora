class InstrumentsAppliedController < ApplicationController
  def show
    @instrument_applied = InstrumentsApplied.find(params[:id])
    @evaluated = Evaluated.new
  end

  def verifications
    @instrument_applied = InstrumentsApplied.find(params[:id])
    @evaluated = @instrument_applied.evaluated
    @instrument = @instrument_applied.instrument

    if @evaluated.match_verification_data?(verification_params)
      redirect_to answer_instrument_path(@instrument), notice: 'Agora você pode acessar o sistema'
    else
      redirect_to instruments_applied_path(@instrument_applied) , notice: 'Dados incorretos. Tente novamente!'
    end
  end

  private

  def verification_params
    params.require(:evaluated).permit(:name, :email, :cpf, :birthdate)
  end
end