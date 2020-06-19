"""
Escreva um algoritmo para ler o salário mensal atual de um funcionário e o percentual de reajuste.
Calcular e escrever o valor do novo salário.

"""

salario = float(input('Qual é o seu salário?\n'))

if salario > 2000:
    desconto = salario * 0.2
elif salario >= 1000:
    desconto = salario * 0.4
else:
    desconto = salario * 0.5

salariof = salario + desconto
print('O salário final é {}'.format(salariof))

