def calculate(lst):
  import numpy as np

  if len(lst) != 9:
    return "List must contain nine numbers."
  x = np.array(lst).reshape(3, 3)
  result = {
    k: [func(x, axis=ax).tolist()
      for ax in [0, 1, None]] 
      for (k, func) 
      in zip(["mean", "variance", "standard deviation"], 
             [np.mean, np.var, np.std])
  } 


  return result
