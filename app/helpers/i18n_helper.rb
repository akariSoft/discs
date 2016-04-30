module I18nHelper
  def tr_down(s)
    return unless s.is_a? String
    s.downcase.tr('ÁÉÍÓÚÜ', 'áéíóúü')
  end
  
  def tr_up(s)
    return unless s.is_a? String
    s.upcase.tr('áéíóúü', 'ÁÉÍÓÚÜ')
  end
end