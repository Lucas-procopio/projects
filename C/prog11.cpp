#include<stdio.h>
#include<stdlib.h>
#include<locale.h>/*Biblioteca que permite usar fun��es para imprimir na tela caracteres especificos de linguas, entre elas o portugu�s.
*/

int main(int argc, char *argv[]){
	setlocale(LC_ALL, "portuguese");
	int n1, n2, n3, soma;
	
	printf("Digite os tr�s valores");
	scanf("%d%d%d", &n1, &n2, &n3, soma); // SOMENTE DE EXEMPLO, N�O USEM NO DIA A DIA E
										 // NEM NA PROVA, SOMENTE SE PEDIDO. =)
	
	soma = (n1*n1)+(n2*n2)+(n3*n3);
	
	printf("A soma dos quadrado �: %d", soma);
	
	system("pause");
	return 0;
}
