#include <iostream>


using namespace std;

int main(int argc, char** argv){
	
	float jardas, libras, litros, quilometrosporHora, valor; 
	int op;
	
	cout << " ---------- MENU ---------- \n";
	cout << "1 - Metros para Jardas\n";
	cout << "2 - Quilogramas para libras\n";
	cout << "3 - Volume em metros cubicos para litros\n";
	cout << "4 - Metros por segundo para quilômetros por hora\n";
	cout <<"Numero: ";
	cin >> op;
	 
	switch(op){
		case 1:
			cout << "Metros: ";
			cin >> valor;
			jardas = valor / 0.91;
			cout << "Jardas: " << jardas;
			break;
		case 2:
			cout << "Quilogramas: ";
			cin >> valor;
			libras = valor/ 0.45;
			cout << "Libras: " << libras;
			break;
		case 3:
			cout << "Volume em Metros Cubicos: ";
			cin >> valor;
			litros = valor/ 0.001;
			cout << "Litros: " << litros;
			break;
		case 4:
			cout << "Metros por segundo:";
			cin >> valor;
			quilometrosporHora = valor * 3.6;
			cout << "Quilômetros por hora: " << quilometrosporHora;
			break;
		default:
			cout << "Numero incorreto. Tente novamente!";
	}
	return 0;
}
