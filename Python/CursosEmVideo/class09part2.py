'Transformação'

frase = "Curso em Video Python"

substituir = frase.replace('Python', 'Android')
'O método substitui uma string por outra'
maiuscula = frase.upper()
'O método deixa a sequencia da string toda em maiúsculo'
minuscula = frase.lower()
'O método deixa a sequencia da string toda em minúsculo'
cap = frase.capitalize()
'Transforma só a primeira letra da string como maiúscula e o resto como minúscula'
titulo = frase.title()
'Transforma a primeira letra de todas as palavras na frase em maiúscula'

sentenca = "   Aprendendo Python  "

remove_espaco = sentenca.strip()
'O método remove os espaços inúteis dados antes e depois da sentença'
remove_espaco_direita = sentenca.rstrip()
'O método remove os espaços inúteis depois da sentença, mantendo os espaços antes da string '
remove_espaco_esquerda = sentenca.lstrip()
'O método remove os espaços inúteis antes da sentença, mantendo os espaços depois da string'

print(substituir)
print(maiuscula)
print(minuscula)
print(cap)
print(titulo)
print(remove_espaco)
print(remove_espaco_direita)
print(remove_espaco_esquerda)