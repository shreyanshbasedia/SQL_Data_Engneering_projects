class BankAccount:
    def __init__(self,Accountholder):
        self._Balance = 0
        self._name = Accountholder
        with open(self._name +'name.txt' , 'w') as namefile:
            namefile.write('Balance = 0\n')
    def deposit(self,amount):
        if amount <= 0:
            return
        self._Balance += amount
        with open(self._name+'namefile.txt','a')as namefile:
            namefile.write('deposit : '+str(amount)+'\n' )
            namefile.write('Balance: '+ str(self._Balance)+'\n')
    def withdraw(self,amount):
        if self._Balance < amount or amount < 0:
            return
        self._Balance -= amount
        with open(self._name + 'namefile.txt','a')as namefile:
            namefile.write('withdraw: '+ str(amount)+ '\n')
            namefile.write('Balance: ' + str(self._Balance)+'\n')
acct = BankAccount('shruti')
acct._Balance = 100000
acct.deposit(200)
acct.withdraw(1203)

        