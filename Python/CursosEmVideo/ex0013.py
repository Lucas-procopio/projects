salario = float(input('Digite o seu salário: \n'))
reajuste = salario + (salario * 0.15)
print('O novo salario do funcionario é R${:0.2F}!'.format(reajuste))
