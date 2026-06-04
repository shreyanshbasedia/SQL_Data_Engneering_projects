import random
import sys
print('rock paper and sessor')
win = 0
tie = 0
loss = 0
while True:
    print("%s win , %s tie , %s loss"% (win , tie , loss))
    while True:
        print("enter the any one option : (R)ock , (P)aper , (S)essor , (Q)uit")
        the_userno = str(input(">"))
        if the_userno == "Q":
            sys.exit()
        if the_userno == "R" or the_userno == "P" or the_userno == "S" or the_userno == "Q":
            break
        print("select any one [R] , [S] ,[P]")
    if the_userno == 'R':
        print("rock....")
    elif the_userno == "P":
        print("PAPER>>>")
    elif the_userno == "S":
        print("Sessor,,,,")
    # for user

    Respons_move = random.randint(1,3)
    if Respons_move == 1:
        computer_move = "R"
        print("ROCK")
    elif Respons_move == 2:
        computer_move = "S"
        print("SESSOR")
    elif Respons_move == 3:
        computer_move = "P"
        print("PAPER")
    # win or loss

    if the_userno == "R" and computer_move == "P":
        print("you losses")
        loss += 1
    elif the_userno == "P" and computer_move == "S":
        print("you losses")
        loss += 1
    elif the_userno == "S" and computer_move == "R":
        print("you losses")
        loss += 1
    elif the_userno == "R" and computer_move == "S":
        print("you WIN")
        win += 1
    elif the_userno == "S" and computer_move == "P":
        print("you WIN")
        win += 1
    elif the_userno == "S" and computer_move == "R":
        print("you WIN")
        win += 1
    elif the_userno == computer_move:
        print(tie)
        tie += 1