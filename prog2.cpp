#include<stdio.h>
#include<stdlib.h>

	
	float salario;
	

int main(){
	float desconto;
	float salarioLiquido;
	
	printf("Salario: ");
	scanf("%f", salario);

if(salario > 2000){
	desconto = 0.2;
}else{
	desconto = 0;
}

	salarioLiquido = salario + ( salario * desconto);
	printf("O Salario Liquido e %0.2f!", salarioLiquido);
	
	
system("pause");
return 0;
}

