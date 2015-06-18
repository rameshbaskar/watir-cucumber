class Employer < Database
  belongs_to :department

  def manager?
    role == "manager"
  end
end
