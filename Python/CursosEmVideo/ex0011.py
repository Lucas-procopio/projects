largura = float(input('Digite a largura:'))
altura = float(input('Digite a altura:'))
area = largura * altura
tinta = area / 2
print('A parede com {} de largura e {} de altura possui uma area de {}. Será necessário {} litros de tinta para pintá-la'.format(largura, altura, area, tinta))