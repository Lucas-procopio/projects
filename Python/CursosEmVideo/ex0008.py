metro = float(input('Digite um valor em metros: \n'))
decimetros = metro *10
centimetros = (metro * 10) *10
milimetros = centimetros * 10
print('O valor de {:0.2F} metros em decímetros é {:0.2F}. Assim como em centimetros {:0.2F} e milímetros {:0.2F}'.format(metro, decimetros, centimetros, milimetros))
