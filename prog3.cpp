#include<stdio.h>
#include<stdlib.h>


	float notaa;
	float notab;

int main(){
	
	float media = 0;
	float soma = 0;
	
	printf("1� nota[0.0 - 10.0]: ");
	scanf("%f", &notaa);
	
	printf("2� nota:[0.0 - 10.0] ");
	scanf("%f", &notab);
	
	soma = (notaa + notab);
	
	media = soma / 2;
	
	if((notaa >= 0.0) && (notab <= 10.0)){

		if(media >=7){
			printf("Aluno aprovado!\n");
		
		}if((media >=5) && (media <7)){
			printf("Aluno Recupera��o!\n");
		}else{
			printf("Aluno Reprovado!\n");
		}
		
	}else{
		printf("Digite uma nota v�lida, por favor!\n");
	}

system("pause");
return 0;


}
