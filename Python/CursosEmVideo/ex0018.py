from math import sin, cos, tan, radians
angulo = float(input('Digite o ângulo desejado:'))
seno = sin(radians(angulo))
cosseno = cos(radians(angulo))
tangente = tan(radians(angulo))
print(' Seno = {:.2f};\n Cosseno = {:.2f}; \n Tangente = {:.2f};'.format(seno, cosseno, tangente))
