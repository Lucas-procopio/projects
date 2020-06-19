#include<stdio.h>
#include<stdlib.h>
#include<locale.h>

int main(int argc, char *argv){
	setlocale(LC_ALL, "portuguese");
	int op, valor;
	
	
	printf("********ESCOLHA UMA OPCAO PARA CONVERTER**********");
	
	printf("\t1 - Decimal para hexadecimal\n");
	printf("\t2 - Hexadecimal para decimal\n");
	printf("\t3 - Decimal para Octal\n");
	printf("\t4 - Octal para decimal\n");
	scanf("%f", &op);
	
	switch(op){
		case 1:
			printf("Digite o decimal: ");
			scanf("%d", valor);
			printf("Hexadecimal: %x", valor);
			break;	
		case 2:
			printf("Digite o hexadecimal: ");
			print("%x", valor);
			printf("Decimal: %d", valor);
			break;
		case 3:
			printf("Digite o decimal: ");
			print("%d", valor);
			printf("Octal: %o", valor);
			break;
		case 4:
			printf("Digite o octal: ");
			print("o", op);
			printf("Hexadecimal: %x", valor);
			break;
	default:
		printf("Valor inválido!");
	}

	system("pause");
	return 0;
}
