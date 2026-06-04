import numpy as np
grid = np.arange(1,10).reshape(3,3)
# x = np.array([1,2,3])
#print(x.reshape(1,3))
#print(x[np.newaxis,:])
print([np.concatenate([grid,grid])])
