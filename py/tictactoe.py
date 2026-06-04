All_list = {1,2,3,4,5,6,7,8,9}
currentplayer , nextplayer , BLANK = 'X','O',' '
def main():
       print('welcom to game')
       gameboard = Game()
       currentplayer , nextplayer = 'X','O'
       while True:
            print(gameboard.getboardstr())
            move = None
            while not gameboard.validspace(move):
               print('whats the move')
               move = int( input())
            gameboard.updatebard(move,currentplayer)
            if gameboard.iswinner(currentplayer):
                    print(gameboard.getboardstr)
                    print(currentplayer+' won the game')
                    break
            elif gameboard.isBoardisfull():
                   print(gameboard.getboardstr)
                   print('tie')
                   break
            currentplayer , nextplayer = nextplayer,currentplayer
       print("thankyou for playing")
class Game:

    def __init__(self,useprittyboard = False, uselogging = False):
        self._space = {}
        for space in All_list:
            self._space[space] = BLANK
    def getboardstr(self):
        return f'''
        {self._space[1]}|{self._space[2]}|{self._space[3]} 1 2 3
        -+-+-
        {self._space[4]}|{self._space[5]}|{self._space[6]} 4 5 6
        -+-+-
        {self._space[7]}|{self._space[8]}|{self._space[9]} 7 8 9 '''
    def validspace(self , space):
        return space in All_list and self._space == BLANK
    def iswinner(self ,player):
        s , p = self._space , player
        return((s[1]==s[2]==s[3]==p)or
               (s[4]==s[5]==s[6]==p)or
               (s[7]==s[8]==s[9]==p)or
               (s[1]==s[4]==s[7]==p)or
               (s[2]==s[5]==s[8]==p)or
               (s[3]==s[6]==s[9]==p)or
               (s[1]==s[5]==s[9]==p)or
               (s[3]==s[5]==s[7]==p))
    def isBoardisfull(self):
        for space in All_list:
            if self._space[space] == BLANK:
                return False
            return True
    def updatebard(self,space,player):
        self._space[space] = player


if __name__ == '__main__':
    main() 