#include<iostream>

using namespace std;

int main(int argc, char** argv){
	
	int i, vertor[6], dobro[6];
	
	for(i=0;i<6;i++){
	cout<<"Qual o valor de vetor["<<i<<"]?"<<endl;
	cin>> vetor[i];
	dobro[i]=vetor[i]*2;		
	}
	for(i=0; i<6;i++){
		cout<<"dobro["<<i<<"[ = "<<dobro[i]<<endl;
	}
	
	system("pause");
	return 0;
}
