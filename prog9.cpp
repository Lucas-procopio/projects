#include<stdio.h>
#include<stdlib.h>
#include<locale.h>/*Biblioteca que permite usar funções para imprimir na tela caracteres especificos de linguas, entre elas o português.
*/

int main(int argc, char *argv[]){
	setlocale(LC_ALL, "portuguese");
	int num1, num2, op;
	
	printf("1° Valor: ");
	scanf("%d", &num1);
	printf("2° Valor: ");
	scanf("%d", &num2);
	printf("\t************ESCOLHA A OPERAÇÃO************\n");
	printf("[1 = Soma, 2 = Subtracao, 3 = Multiplicacao, 4 = Divisao]\n");
	scanf("%d", &op);
	
	switch(op){
		case 1:
			printf("%.1d + %.1d = %.1d", num1, num2, (num1+num2));
			break;
		case 2:
			printf("%.1d - %.1d = %.1d", num1, num2, (num1-num2));
			break;
		case 3:
			printf("%.1d x %.1d = %.1d", num1, num2, (num1*num2));
			break;
		case 4:
			printf("%.1d / %.1d = %.1d", num1, num2, (num1/num2));
			break;
		default:
			printf("\n Opção invalida!");
	}
	
	system("pause");
	return 0;
}
