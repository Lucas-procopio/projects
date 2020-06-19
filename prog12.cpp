#include<stdio.h>
#include<stdlib.h>

	
//Taxa de Natalidade = (num de crianças nascidas * 1000)/ num de habitantes;
//Taxa de Mortalidade = (num de obitos * 1000)/ num de habitantes;

int main(int argc, char *argv[]){


	float txNatalidade, txMortalidae;
	int numCriancasNascidas, numObitos, numHabitantes;
	char menu;
	
	printf("\n\t\t*********MENU*********\n\n");
	printf("Digite N para taxa de natalidade:\n");
	printf("Digite M para taxa de mortalidae: \n");
	scanf("%c", &menu);
	
	switch(menu){
		case 'N':
			printf("Digite o numero de nascimentos: ");
			scanf("%d", &numCriancasNascidas);
			printf("Digite o numero de habitantes: ");
			scanf("%d", &numHabitantes);
			txNatalidade = (numCriancasNascidas * 1000) / numHabitantes;
			printf("A taxa de natalidade e %.2f\n", txNatalidade);
			break;
		case 'M':
			printf("Digite o numero de obitos: ");
			scanf("%d", &numObitos);
			printf("Digite o numero de habitantes: ");
			scanf("%d", &numHabitantes);
			txMortalidae = (numObitos * 1000)/ numHabitantes;
			printf("A taxa de mortalidade e %.2f\n", txMortalidae);	
			break;
	}
	
	system("pause");
	return 0;
}
