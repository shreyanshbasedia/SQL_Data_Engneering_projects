import numpy as np
import array
np.random.seed(0)
num = np.linspace(0,1,5)
num2 = np.random.random((3,3))
num3 = np.random.normal(10,20,(3,3))
num4 = np.random.randint(10,20,(3,5))
num5 = np.eye(10)
X1 = np.random.randint(10, size = 6)
X2 = np.random.randint(10, size = (3,4))
X3 = np.random.randint(10, size = 6)
X1[0] = 3.145678 
2 = np.arange(10)
x2_sub = X2[:3,:2]
x2_sub[0,0] = 99 
#print(X[:5])
print()
# print(X2)
# print(X1)
# print(X2.shape)
# print(X2.dtype)