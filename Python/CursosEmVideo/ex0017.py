import math
cateto_oposto = float(input('Digite o comprimento do cateto oposto do triângulo:'))
cateto_adjacente = float(input('Digite o comprimento do cateto adjacente do triângulo:'))

h = (cateto_oposto ** 2 + cateto_adjacente ** 2) ** (1/2)
print('O valor da hipotenusa é {:.2f}'.format(h))

co = float(input('Digite o valor do cateto oposto:'))
ca = float(input('Digite o valor do cateto adjacente: '))

hipo = math.hypot(co, ca)
print('O valor da hipotenusa é {:.2f}'.format(hipo))

