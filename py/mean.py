class maths():
    def __init__(self, number ):
        self.number = number
    def cal_print(self):
        if not self.number:
            return "empity list "
        # mean
        total = 0 
        for n in self.number:
            total += n
        mean = total/len(number)
        # max
        maximum = self.number[0]
        for n in number :
            if n > maximum:
                maximum = n
        # minimum
        minimum = number[0]
        for n in number :
            if n < minimum:
                minimum = n
        print(f"{mean} mean")
        print(f"{maximum} maximum")
        print(f"{minimum} minimum")

number = [2,3,4,5,6,7,8,878,6,4,3,54]
state = maths(number)
state.cal_print()





        




    