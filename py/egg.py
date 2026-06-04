# this is a wrong way
# try:
#     fileobj = open('span.txt','w')
#     eggs = 42/0
#     fileobj.close()
# except:
#     print("some error occored")

# with open('span.txt','w') as fileobj:
#     fileobj.write("hello, world")

class someclass:
    def __eq__(self, value):
        if value is None:
            return True
spam = someclass()
spam == None

spam is None