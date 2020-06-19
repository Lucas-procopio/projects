"""

Faça um algoritmo que leia a idade de uma pessoa expressa em anos, meses e dias e escreva a idade
dessa pessoa expressa apenas em dias. Considerar ano com 365 dias e mês com 30 dias

"""

print('Digite a sua idade abaixo')
ano = int(input('Anos: '))
mes = int(input('Meses: '))
dias = int(input('Dias: '))

idade = (ano * 365) + (mes * 12) + dias

print('A sua idade em dias é {}'.format(idade))