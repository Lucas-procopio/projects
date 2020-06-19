#include<stdio.h>
#include<stdlib.h>
#define salariominimo 1045

int main(int argc, char *argv[]){
	int numerodependentes;
	float salariofunc, taxaimpostosalario, impostoderenda, impostobruto, impostoliquido, calcdependentes;
	
	printf("Digite o seu salario: ");
	scanf("%f", &salariofunc);
	
	
	printf("Digite o n de dependentes: ");
	scanf("%d", &numerodependentes);
	
	taxaimpostosalario = 0.04 * salariofunc;
	calcdependentes = numerodependentes * 200;
	
	if(salariofunc > (salariominimo)){
		impostobruto = 0.2 * salariofunc;	
		impostobruto = 0.04 * impostobruto + impostobruto;
	}else if(salariofunc > (salariominimo * 5 )){
		impostobruto = 0.08 * salariofunc;
		impostobruto = 0.04 * impostobruto + impostobruto;
	}else{
		impostobruto = 0;
	}
	
	impostoliquido = impostobruto - calcdependentes;
	impostoderenda = impostoliquido - taxaimpostosalario;
	
	
	if(impostoderenda == 0){
		printf("*****SEU IMPOSTO*****\n\n");
		printf("Imposto Bruto: %.2f\n", impostobruto);
		printf("Imposto Liquido: %.2f\n", impostoliquido);
		printf("Imposto a Receber: %.2f\n", impostoderenda );
	}else if(impostoderenda > 0){
		printf("*****SEU IMPOSTO*****\n\n");
		printf("Imposto Bruto: %.2f\n", impostobruto);
		printf("Imposto Liquido: %.2f\n", impostoliquido);
		printf("Imposto a Receber: %.2f\n", impostoderenda );
	}else{
		printf("*****SEU IMPOSTO*****\n\n");
		printf("Imposto Bruto: %.2f\n", impostobruto);
		printf("Imposto Liquido: %.2f\n", impostoliquido);
		printf("Imposto a Receber: %.2f\n", impostoderenda );
	}
	
	system("pause");
	return 0;
}
