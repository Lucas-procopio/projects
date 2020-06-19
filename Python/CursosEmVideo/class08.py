' import biblioteca - importa toda um biblioteca e suas funcionalidades'
'from biblioteca importa funcionalidades - importa funcionalidades específicas de uma biblioteca'

import math
n = int(input('Digite um número:'))
raiz = math.sqrt(n)
print('A raiz quadrada do número {} é {:0.2f}'.format(n, raiz))

from math import sqrt, ceil
n = int(input('Digite um número:'))
raiz = sqrt(n)
print('A raiz quadrada do número {} é {:2}.'.format(n, ceil(raiz)))