#include<stdio.h>
#include<stdlib.h>



int main(){
	int a;
	int s;
	int n;
	
	printf("numero: ");
	scanf("%d", &n);
	
	a = n - 1;
	s = n + 1;
	
	printf("Antecessor: %d\n",a);
	printf("Sucessor: %d\n",s);
	
	system("pause");
	return 0; 
}


