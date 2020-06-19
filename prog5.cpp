#include<stdio.h>
#include<stdlib.h>


int main(){
	float celsius = 0;
	float fahrenheit = 0;
	
	printf("Digite uma temperada para converter Fahrenheit para Celsius: ");
	scanf("%f", &fahrenheit);
	
	celsius = 5.0 * ((fahrenheit - 32.0)/9.0);
	
	printf("A temperatura em Celsius e %.2f\n",celsius);
	

	system("pause");
	return 0;
}
