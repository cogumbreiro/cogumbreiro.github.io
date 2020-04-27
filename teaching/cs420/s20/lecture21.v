machine = while True: pass

def A_tm(machine, input):
  if machine.accepts(input):
    return True
  else:
    return False

def negator(code_of_machine):
  """
  Does the machine in the source code reject its code if you give as input.

  f(f.code) == reject/loop?
  
  """
  return not A_TM(parse(code_of_machine), code_of_machine)
  # Same as:
  # return not (parse(code_of_machine) accepts code_of_machine)
  # Same as:
  # return parse(code_of_machine) not accepts code_of_machine
  # Same as:
  # return machine reject its code as input?
  
 
 negator(negator) ?
 
 negator(negator) = Accept
 ->
 negator rejects negator
 

