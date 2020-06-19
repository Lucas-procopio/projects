#include<stdio.h>
#include<stdlib.h>


int main(){
	int num;
	
	printf("Digite um numero: \n");
	scanf("%d", &num);
	
	if((num % 5 == 0) && (num % 3 == 0)){
		printf("E divisivel!\n");
		
	}else{
		printf("Nao e divisivel!\n");
	}
	
	system("pause");
	return 0;
}
