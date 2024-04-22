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
      redirect_to answer_instruments_applied_path(@instrument_applied), notice: 'Agora você pode acessar o sistema'
    else
      redirect_to instruments_applied_path(@instrument_applied) , notice: 'Dados incorretos. Tente novamente!'
    end
  end

  def finished
    @instrument_applied = InstrumentsApplied.find(params[:id])

    result = 0
    params[:answers].each do |question_id, value|
      result += value.to_i
    end

    @instrument_applied.finish!
    @instrument_applied.update(result: result)

    redirect_to finished_message_instruments_applied_path(@instrument_applied)
  end

  def finished_message
    @instrument_applied = InstrumentsApplied.find(params[:id])
  end

  def answer
    @instrument_applied = InstrumentsApplied.find(params[:id])
    @instrument = @instrument_applied.instrument
  
  end

  private

  def verification_params
    params.require(:evaluated).permit(:name, :email, :cpf, :birthdate)
  end
end