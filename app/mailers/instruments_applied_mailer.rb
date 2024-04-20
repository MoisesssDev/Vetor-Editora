class InstrumentsAppliedMailer < ApplicationMailer
  default from: 'notifications@vetoreditora.com'

  def notify(evaluated, instruments_applied, instrument)
    @evaluated = evaluated
    @instrument = instrument
    @instrument_applied = instruments_applied
    mail(to: evaluated.email, subject: 'Você tem um novo instrumento para responder')
  end
end
