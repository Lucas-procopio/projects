#include<stdio.h>
#include<stdlib.h>




int main(){
	int numAlunos;
	int numSala;
	int capSala;
	int alunoSemCadeiras;
	
	printf("Num da Sala:");
	scanf("%d", &numSala);
	
	printf("Capacidade da Sala:");
	scanf("%d", &capSala);
	
	printf("Num de Alunos:");
	scanf("%d", &numAlunos);
	
	alunoSemCadeiras = numAlunos - capSala;
	
	
	if(numAlunos > capSala){
		printf("O numero da sala e %d\n", numSala);
		printf("A capacidade total da sala e %d\n", capSala);
		printf("Sala Lotada. Alunos %d sem cadeiras\n", alunoSemCadeiras);
	}else{
		printf("O numero da sala e %d\n", numSala);
		printf("A capacidade total da sala e %d\n", capSala);
		printf("Numero de cadeiras ocupadas: %d\n", numAlunos);
	}

	
	system("pause");
	return 0;
}
