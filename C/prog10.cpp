#include<stdio.h>
#include<stdlib.h>
#include<locale.h>/*Biblioteca que permite usar fun��es para imprimir na tela caracteres especificos de linguas, entre elas o portugu�s.
*/

int main(int argc, char *argv[]){
	setlocale(LC_ALL, "portuguese");
	int op;
	
	
	printf("\t************ESCOLHA O M�S************\n");
	printf("\t1- JANEIRO\n\t2- FEVEREIRO\n\t3- MAR�O\n\t4- ABRIL\n\t5- MAIO\n\t6- JUNHO\n\t7- JULHO\n\t8- AGOSTO\n\t9- SETEMBRO\n\t10- OUTUBRO\n\t11- NOVEMBRO\n\t12- DEZEMBRO\n");
	printf("Mes: ");
	scanf("%d", &op);
	
	switch(op){
		case 1:
			printf("JANEIRO!");
			break;
		case 2:
			printf("FEVEREIRO");
			break;
		case 3:
			printf("MAR�O");
			break;
		case 4:
			printf("ABRIL");
			break;
		case 5:
			printf("MAIO");
			break;
		case 6:
			printf("JUNHO");
			break;
		case 7:
			printf("JULHO");
			break;
		case 8:
			printf("AGOSTO");
			break;
		case 9:
			printf("SETEMBRO");
			break;
		case 10:
			printf("OUTUBRO");
			break;
		case 11:
			printf("NOVEMBRO");
			break;
		case 12:
			printf("DEZEMBRO");
			break;
		default:
			printf("VOC� DIGITOU UM N�MERO INCORRETO. TENTE DE NOVO!");
	}
	
	system("pause");
	return 0;
}
