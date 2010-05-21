class SpamChecker
  def initialize(code)
    @code = code
  end

  def spam?
    !matches_keywords?
  end

  def matches_keywords?
    @code =~ /function|window|document|document\.location|alert\(/
  end
end
