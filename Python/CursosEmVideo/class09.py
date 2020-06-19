'Manipulação de texto:'
'Cadeia de caracteres ou de string'
'Quando digito uma frase como string, o python armazena no computador como se cada caracter fosse um número'
'OBS: O Python diferencia letras maiúsculas de minúsculas // Ele começa a contar as caracteres do número zero'

'O [] dentro do Python é usado para sinalizar uma lista'

'Selecionando (fatiando) o caracter'
'--->   frase[0:6:0]'
'Primeiro dígito = núm do primeiro caracter selecionado'
'Segundo dígito = núm do último caracter a ser selecionado' '(ele sempre extraí o até o anterior. ex: se colocaro n° 21 irá trás até o n° 20)'
'Terceiro dígito = núm da quantidade de caracteres a serem puladas'

frase = 'Curso em video Python'

'len --> Método que calcula a quantidade de caracteres'
n = len(frase)
'count --> Método para calcular a quantidade de uma caracter específica'
m = frase.count('o')
'frase.count(o, 0, 15) -- Uma variação do método que já faz o fateamento'
a = frase.find('video')
'O método find serve para achar uma string específica dentro da cadeia de string, informando a posição dentro da sentença'
h = 'Curso' in frase
'A função in serve para verificar a existência de uma string na cadeia de string'

print(n)
print(m)
print(a)
print(h)