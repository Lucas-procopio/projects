#include<stdio.h>
#include<stdlib.h>
#include<locale.h>


int main(int argc, char *argv[]){
	setlocale(LC_ALL, "portuguese");
	char sexo, nome[30];
	
	printf("\t*********MENU*********\n");
	printf("Digite M para masculino:\n");
	printf("Digite F para feminino: \n");
	scanf("%c", &sexo);
	
	switch(sexo){
		case 'F':
			printf("Qual é o seu nome, querida?\n");
			scanf("%s", &nome);
			printf("Bem-vinda, %s", nome);
			break;
		case 'M':
			printf("Qual é o seu nome, irmão? \n");
			scanf("%s", &nome);
			printf("Bem-vindo, %s", nome);
			break;
		default:
			printf("Informação incorreta, digite novamente!");
	}
	
	system("pause");
	return 0;
}
