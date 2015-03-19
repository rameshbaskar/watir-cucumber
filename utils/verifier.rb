module Verifier
  def verify_equal(expected, actual)
    raise_error("Assertion failure. Expected was #{expected} while actual is #{actual}") unless expected == actual
  end

  def verify_true(actual)
    verify_equal(true, actual)
  end

  def verify_false(actual)
    verify_equal(false, actual)
  end
end
