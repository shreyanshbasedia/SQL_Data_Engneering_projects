# import time , sys
# indent = 0
# indent_inc = True
# try :
#     while True:
#         print(" "*indent , end = " ")
#         print("**********")
#         time.sleep(0.1)
#         if indent_inc:
#             indent += indent
#             if indent == 20:
#                 indent_inc = False
#         else:
#             indent -= indent
#             if indent == 0:
#                 indent_inc = True
# except KeyboardInterrupt:
#         sys.exit
       

# def intro(name , greeting = "hello"):
#      print(greeting +","+ name)

# intro("shreaynsh")

# agrs = ['cat','dog','elephand','cow','duck']

# print(*agrs)
# print(*agrs , sep="-")

# def product(*agrs):
#     result = 1
#     for num in agrs:
#         result *= num
#     print(result)
# # product(1,2,3,4,5,6,)

# def frommolecule(**kwargs):
#     if len(kwargs) == 2 and kwargs['hydrogen'] == 2 and kwargs['oxygen'] == 1:
#         return 'water'


# print(frommolecule(hydrogen = 2 , oxygen = 1))

# def printlower(*agrs,**kwagrs):
#     agrs = list(agrs)
#     for i ,value in enumerate(agrs):
#         agrs[i] = str(value).lower()
#         return print(*agrs,**kwagrs)
    
# printlower('shreIoOl')
    
ractangle = lambda rect : (rect[0]*2)+(rect[1]*2)
print(ractangle([2,4]))

mapobj = filter(lambda n : n %2 ==0  , [1,3,4,5,6,3,8,6])
print(list(mapobj))