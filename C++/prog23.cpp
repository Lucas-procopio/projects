#include <iostream>


using namespace std;


int main(int argc, char** argv){
	
	float comprimento, largura, area, perimetro;
	
	cout << "Largura:"<<endl;
	cin >>largura;
	cout << "Comprimento:"<<endl;
	cin >>comprimento;
	
	area = 	largura * comprimento;
	perimetro = 2 * (area);
	
	cout <<"Area: "<<area<<endl;
	cout <<"Perimetro: "<<perimetro<<endl;	
	system;
	return 0;
}
