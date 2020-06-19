#include<stdio.h>
#include<stdlib.h>


	int a;
	int b;


int main(){
	
	int soma = 0;
	
	printf("Informe o 1º numero: ");
	scanf("%d", &a);
	
	printf("Informe o 2º numero: ");
	scanf("%d", &b);	
	
	soma = a + b;
	
	if(soma > 20){
		printf("A Soma resultou no numero %d, que e maior do que 20.", soma);
	}else{
		printf("A Soma resultou no numero %d, que e menor ou igual a 20.", soma);
	}
	
	system("pause");
	return 0;
}
