import random

number = random.randint(1,20)

for guass_no in range(1,7):
    print("gauss the no.")
    user_number = int(input("enter the no."))
    
    if user_number > number :
        print("your no. is to big ")
    elif user_number< number:
        print("your no. is too small")
    else:
        break

if user_number == number:
    print("hell ye you did " , user_number,"is the no.")
else:
    print("nope the number is", number)

