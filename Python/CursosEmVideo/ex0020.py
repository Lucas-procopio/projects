from random import shuffle
n1 = str(input('Primeiro aluno:'))
n2 = str(input('Segundo aluno:'))
n3 = str(input('Terceiro aluno:'))
n4 = str(input('Quarto aluno:'))
aluno = [n1, n2, n3, n4]
shuffle(aluno)
print('A ordem de apresentação é {}'.format(aluno))
