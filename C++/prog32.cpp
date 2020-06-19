#include<iostream>
#include<locale.h>

using namespace std;

int main(int argc, char** argv){
	setlocale(LC_ALL, "portuguese");
	const int LINHA=10, COLUNA=20;
	int valores[LINHA][COLUNA], contador = 1;
	
	for(int i = 0; i<LINHA; i++)
	for(int j = 0; j<COLUNA; j++){
		valores[i][j]=contador;
		contador++;
	}
	
	for(int i=0; i<LINHA; i++){
		for(int j=0; j<COLUNA; j++)
		cout<<valores[i][j]<<endl;
	}
	
	system("pause");
	return 0;
}
