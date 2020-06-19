#include <iostream>

using namespace std;


int main(int argc, char** argv){

	int dias;
	float semanas;
	
	cout << "Digite o valor em dias:";
	cin >> dias;

	semanas = dias / 7;
	
	cout << "Total em semanas: " << semanas<<endl;
	return 0;
};

