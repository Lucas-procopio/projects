#include<iostream>

using namespace std;

int main(int argc, char** argv){
	int numAlunos;	
	float media = 0, soma = 0;
	
	cout<<"Informe a quantidade de alunos: ";
	cin>> numAlunos;
	
	float nota[numAlunos]; //vetor com tamanho aberto
	//inserção de valores
	for(int i=0; i < numAlunos; i++){	
	cout<<"Nota do Aluno:";
	cin>>nota[i]; 
	soma+=nota[i];//soma de cada valor do vetor
	
	}
	media = soma/numAlunos;
	cout<<"Media geral:"<<media<<endl;
	cout<<endl<<"*****Alunos com notas superior a média*****"<<endl;
	//Achar alunos com a nota maior que a media
	for(int i = 0; i < numAlunos; i++){
		if(nota[i] > media)
		cout<<"Alunos"<<i<<" nota = "<<nota[i]<<endl;
	}
	system("pause");
	return 0;
}
