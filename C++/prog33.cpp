#include<iostream>



using namespace std;


int main(int argc, char** argv){
	const int ALUNOS=10, PROVAS=3;
	int  notasClasse[ALUNOS][PROVAS], media[ALUNOS];

	for(int i = 0; i < ALUNOS; i++)
	for(int j = 0; j < PROVAS; j++){
		cout<<"Alunos "<<i<<" prova "<<j<<" :";
		cin>>notasClasse[i][j];
	}

	for(int i =0; i<ALUNOS; i++){
		media[i]=0.0;
		for(int j=0; j<PROVAS; j++)
		media[i]=media[i]+notasClasse[i][j];
		media[i]/=PROVAS;
	}	
	
	for(int i=0; i<ALUNOS; i++){
		cout<<"Aluno "<<i<<" media = "<<media[i]<<endl;
	}
	
	
	system("pause");
	return 0;
}
