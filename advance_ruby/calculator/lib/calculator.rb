class Operation
  def calculate(operand_1, operator, operand_2)
    operand_1.send operator, operand_2
  end
end