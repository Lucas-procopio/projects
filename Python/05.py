"""
Escreva um algoritmo para ler o número total de eleitores de um município, o número de votos
brancos, nulos e válidos. Calcular e escrever o percentual que cada um representa em relação ao total
de eleitores.

"""


numero_total = int(input('Número de eleitores: '))
branco = int(input('Votos brancos: '))
nulos = int(input('Votos nulos: '))
validos = numero_total - (branco + nulos)
b = (branco/numero_total) * 100
n = (nulos/numero_total) * 100
v = (validos/numero_total) * 100
print('O percentual de brancos e nulos é {} e {}. E, o percentual de votos válidos é {}'.format(b, n, v))