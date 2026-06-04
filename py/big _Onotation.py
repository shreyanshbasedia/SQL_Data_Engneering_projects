import time ,cProfile
# print(timeit.timeit('a,b = 34,56; a = a^b ; b = a^b ; a = a^b'))

# print(timeit.timeit('a,b = 34,56;  temp = a ; b = a ; temp = b'))

# print(timeit.timeit('a,b = 34,56; a,b = b,a'))

# print(timeit.timeit('random.randint(1,100)', 'import random', number = 10000000 ))

# span = "hello"
# print(timeit.timeit('print(span)', number = 1,globals=globals()))

def addupnumber():
    total = 0
    for i in range(1,1000001):
        total += i

cProfile.run('addupnumber()')