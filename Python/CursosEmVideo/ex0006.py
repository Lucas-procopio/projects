nome = str(input('Qual é o seu nome?\n'))
n = float(input('Digite um número:'.format(nome)))
raiz = n ** (1/2)
triplo = n * 3
dobro = n * 2
print('{}, a raiz quadrada do número que você digitou é {}\n'.format(nome, raiz))
print('O dobro e o triplo de {} são {} e {}!\n'.format(n, dobro, triplo))