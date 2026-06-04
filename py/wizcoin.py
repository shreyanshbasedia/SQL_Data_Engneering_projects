class Wizcoin:
    def __init__(self,gon,sick,nuts):
        self.gon = gon 
        self.sick = sick
        self.nuts = nuts
    def valuse(self):
        return(self.gon*17*29)+(self.sick*29)+(self.nuts)
    def weight(self):
        return(self.gon * 40)+(self.sick*30)+(self.nuts*10)