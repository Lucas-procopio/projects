#include<iostream>

using namespace std;

int main(int argv, char** argc){
	int a=2, b=4, c;
	
	if(!(a==a && a!=a)){
		cout<<"Certo\n";
	}else{
		cout<<"Errado\n";
	}
	
	
	system("pause");
	return 0;
}
