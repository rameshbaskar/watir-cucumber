module Verifier
  def verify_equal(expected, actual, message = nil)
    message ||= "Assertion failure"
    raise_error("#{message}. Expected was #{expected} while actual is #{actual}") unless expected == actual
  end

  def verify_true(actual, message = nil)
    verify_equal(true, actual, message)
  end

  def verify_false(actual, message = nil)
    verify_equal(false, actual, message)
  end
end
