#include <iostream>

using namespace std;

int main(int argc, char** argv){
	float precoA, precoB, precoC, valorFinal;
	int quantA, quantB, quantC;

	
	cout << "Preço do 1° Produto: "<<endl;
	cin >> precoA;
	cout << "Quantidade do 1° Produto: "<<endl; 
	cin >> quantA;
	
	cout << "Preço do 2° Produto: "<<endl;
	cin >> precoB;
	cout << "Quantidade do 2° Produto: "<<endl; 
	cin >> quantB;
	
	cout << "Preço do 3° Produto: "<<endl;
	cin >> precoC;
	cout << "Quantidade do 3° Produto: "<<endl; 
	cin >> quantC;
	
	valorFinal = (precoA * quantA) + (precoB * quantB) + (precoC * quantC);
	
	if(valorFinal <= 100){
		cout << "Pagamento à vista!";
	}else if(valorFinal <=200){
		cout << "Parcelar em 2 vezes!";
	}else{
		cout << "Parcelar em 4 vezes!";
	}
		
	return 0;
}
