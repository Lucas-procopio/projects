#include<iostream>


using namespace std;

int main(int argc, char** argv){
	
	char letra;
	
	cout << "------MENU------"<<endl;
	cout <<"Digite uma letra:"<<endl;
	cin >> letra;
	
		switch(letra){
			case 'a':
				cout <<"Vogal!";
				break;
			case 'e':
				cout <<"Vogal!";
				break;
			case 'i':
				cout <<"Vogal!";
				break;
			case 'o':
				cout <<"Vogal!";
				break;
			case 'u':
				cout <<"Vogal!";
		default:
			cout << "Nao e vogal!";
		}
			
	return 0;
}
