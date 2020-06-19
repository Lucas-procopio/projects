#include <iostream>


using namespace std;

int main(int argc, char** argv){
	float sal, salNovo;
	string nome;
	cout << "Digite o salario:";
	cin >> sal;
	cout << "Digite o seu nome:";
	cin >> nome;
	
	if(sal < 500){
		salNovo = sal * 1.1;
		cout << nome <<", salario novo: "<< salNovo <<endl;
	}else if(sal >= 500 && sal<= 1000){
		salNovo = sal * 1.07;
		cout << nome <<", salario novo: " << salNovo <<endl;
	}else{
		salNovo = sal * 1.06;
		cout << nome <<", salario novo: " << salNovo <<endl;
	}
	system("pause");
	return 0;
}


