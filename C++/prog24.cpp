#include<iostream>


using namespace std;


int main(int argc, char** argv){
	
	double num, fat;
	
	cout<<"Digite um valor: \n";
	cin>> num;
	
	for(int i =0; i<=num, i++){
		fat*=i; // atalho para fat = fat * i
	}
	
	return 0;
	system("pause");
}
