#include<iostream>

using namespace std;

int main(int argc,char** argv){
	
	int num, par, impar;
	char escolha;
	
	
do{	
		cout<<"Digite um numero";
		cin>> num;
		
		if(num%2 ==0){
			par+= num;
		}else{
			impar+= num;
		}
		cout<<"Deseja continuar?(s/n):\n";
		cin>>escolha;
	}while(escolha =='s'|| escolha=='S');

	cout<<"Soma dos pares:"<<par<<endl;
	cout<<"Soma dos impares:"<<impar<<endl;
	
	return 0;
	system("pause");
}


