import random
alunoa = str(input('Qual é o nome do primeiro aluno?'))
alunob = str(input('Qual é o nome do segundo aluno?'))
alunoc = str(input('Qual é o nome do terceiro aluno?'))
alunod = str(input('Qual é o nome do quarto aluno?'))
alunos = [alunoa, alunob, alunoc, alunod]
escolha = random.choice(alunos)
print('O aluno {} que irá apagar o quadro'.format(escolha))
