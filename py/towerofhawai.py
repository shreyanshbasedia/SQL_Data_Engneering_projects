# jai shree ram , shree ganeshya namaha
import copy  , sys

total_disks = 5
solved_tower_disk = list(range(total_disks,0,-1))

def main():
    print('this is a game made by shreyansh basedia ')
     
    Tower = {"A" :copy.copy(solved_tower_disk),"B":[],"C":[]}
    
    while True:
        display_tower(Tower)

        from_tower , to_tower = getplayermovetower(Tower)

        disk = Tower[from_tower].pop()
        Tower[to_tower].append(disk)

        if solved_tower_disk in (Tower["B"],Tower["C"]):
            display_tower(Tower)
            print("you have solverd the game")
            sys.exit()
def getplayermovetower(Tower) :
    while True:
        print("enter the game by entering 'to' or 'from' else Quit")
        print("by typing AB for A tower to B ")
        print()

        response = input(">").upper().strip()

        if (response ==  'QUIT'):
            print("Thanku for playing with us")
            sys.exit()
        
        if response not in ('AB','BC','CA','CB','AC','BA'):
            print("select form ('AB','BC','CA','CB','AC','BA') ")
            continue
        from_tower , to_tower = response[0],response[1]

        if len(Tower[from_tower]) == 0:
            print("tower is empity")
            continue
        elif len(Tower[to_tower]) == 0:
            return from_tower,to_tower
        elif Tower[from_tower][-1] > Tower[to_tower][-1]:
            print("you can not put a big disk on small one ")
            continue
        else:
            return from_tower , to_tower
def display_tower(Tower):
    for level in range(total_disks -1 , -1 , -1):
        for Tower_col in (Tower['A'],Tower["B"],Tower['C']):
            if level >= len(Tower_col):
                display_disk(0)
            else:
                display_disk(Tower_col[level])
        print()
    empity_space = ' '*(total_disks)
    print("{0}  A{0}{0} B{0}{0} C \n".format(empity_space))
    

def display_disk(width):
    
    empity_space = ' '*(total_disks - width)
    if width == 0:
        print(f"{empity_space}||{empity_space}",end = '')
    else:
        disk = '@'*width
        numlebel = str(width).rjust(2,'_')
        print(f"{empity_space}{disk}{numlebel}{disk}{empity_space}", end= "")
    
if __name__ == "__main__":
    main()

