#include<iostream>
#include<locale>
//#include<cstdlib>
/*
Fa�a um programa em que o seu personagem est� abrindo um ba�, o personagem 
se encontra com invent�rio quase cheio e encontra dois inteis, ap�s o primeiro
item entrar no invent�rio, o segundo � perguntado ao jogador se ele quer substituir
o primeiro item da lista.

Os itens devem ser exibidos antes e depois de abrir o ba�.

*/

using namespace std;


int main(int argv, char** argc){
	setlocale(LC_ALL, "English");
	
	int inventory = 29;
	bool op;
	string player, thing;
	
	cout<<"Do you want include a new thing in inventory?[1 - Yes ; 0 - No]"<<endl;
	cin>> op;
	
		switch(op){
			case 1:
				while(inventory =30){
				cout<<"Your inventory is "<<inventory<<endl;
				cout<<"What do you wanna include? Describe:"<<endl;
				cin>>thing;
				cout<<"Are you certain? You'll change the first object in your inventory!"<<endl;
				inventory += 1;
				cout<<"Your inventory is "<<inventory<<endl;
				}
				break;
			case 0:
			cout<<"It's Okay!"<<endl;
			break;	
		default:
			cout<<"Write again, please!"<<endl;
			// continue; Verificar depois	
		}
		
	system("pause");
	return 0;
}
