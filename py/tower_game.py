import sys
def tower_game(tower):
    while True:
        print('to move the tower type "from" and "to" towers. or quit')
        response = input(">").upper().strip()
        if response == "quit":
            print("thankyou for playing")
            sys.exit()
        
        if response not in ("AB","BC","CA","AC","BA","CB"):
            print('response is wrong write from this "AB","BC","CA","AC","BA","CB"')
tower_game()