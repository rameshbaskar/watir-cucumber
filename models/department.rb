class Department < Database
  has_many :employers

  def head
    employers.find { |e| e.role == 'department_head'}
  end
end
