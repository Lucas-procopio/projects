#include <iostream>

using namespace std;

int main(int argc, char** argv){
	int num;
	
	cout << "Digite um numero: "<<endl;
	cin >> num;
	
	if(num >80){
		cout << "No intervalo";
	}else if(num < 25 or num ==40){
		cout << "No intervalo";
	}else{
		cout << "Fora do intervalo";
	}
	
	system("pause");
	return 0;
}


