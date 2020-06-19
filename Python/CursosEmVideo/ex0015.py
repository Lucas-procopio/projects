km = float(input('Quantos quilometros você rodou com o carro alugado?'))
dias = int(input('Quantos dias você ficou com o carro?'))
valord = dias * 60
valork = km * 0.15
print('O valor a pagar é {:.2f}, {:.2f} referente ao total de dias e {:.2f} referente ao total de quilometros rodados'.format(valord + valork, valord, valork))
