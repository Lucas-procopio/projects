#include <iostream>

using namespace std;

int main(int argc, char** argv){
	int num1, num2;
	
	cout << "Digite num 1: " << endl;
	cin >> num1;
	
	cout << "Digite num 2: \n";
	cin >> num2;
	
	if(num1 == num2){
		cout << "Sao iguais";
	}else{
		cout << "Sao diferentes";
	}
	
	return 0;
}
