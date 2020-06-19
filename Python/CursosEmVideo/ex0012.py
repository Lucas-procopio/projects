pi = float(input('Digite o valor do produto:\n'))
q = int(input('Digite a quantidade de produtos que irá comprar: \n'))
if q <= 10:
    pf = pi * q
    print('O valor final é de {}\n'.format(pf))
else:
    pd = (pi - (pi * 0.05)) * q
    print('O valor final é de {}\n'.format(pd))