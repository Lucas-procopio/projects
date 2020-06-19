#include<iostream>
#include<locale.h>

using namespace std;

int main(int argc, char** argv){
	setlocale(LC_ALL, "portuguese");
	
	int i, n, maior;
	
	cout<<"Quantidade de números:"<<endl;
	cin>>n;
	
	int num[n];
	
	for(i = 0; i < n; i++){
	
	cout<<"Digite o número:";
	cin>>num[i];
	}
	
	maior = num[0];
	int imaior = 0;
	for(int i =0; i<n; i++){
		if(num[i]> maior){
			maior = num[i];
			imaior = i;
		}
	}
	
	cout<<"Número maior: "<<maior<<endl;
	cout<<"Indice: "<<imaior<<endl;
	
	system("pause");
	return 0;
}
