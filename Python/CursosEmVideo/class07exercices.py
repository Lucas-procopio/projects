nome = str(input('Qual é o seu nome?\n'))
n = int(input('Digite um número, {}: \n'.format(nome)))
sucessor = n + 1
antecessor = n - 1
print('O antecessor do número {} é {}. Seu sucessor é o número {}. \n'.format(n, antecessor, sucessor))