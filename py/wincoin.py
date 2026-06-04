import wizcoin
purce = wizcoin.Wizcoin(20,40,10)
print('G:', purce.gon,'S:',purce.sick,'N:',purce.nuts)
print('Total value', purce.valuse())
print('total weight', purce.weight())
print()

coinJar = wizcoin.Wizcoin(133,0,0)
print('G:', coinJar.gon,'S:',coinJar.sick,'N:',coinJar.nuts)
print('Total value', coinJar.valuse())
print('total weight', coinJar.weight())
print()
