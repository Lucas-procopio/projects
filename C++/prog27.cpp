#include<iostream>

using namespace std;

int main(){
	
	int num, i, mult;
	
	cout<<"Digite um valor: [1-10]"<<endl;
	cin>>num;
	
	for(i= 0; i<=10; i++){
		mult *= i;
		cout<<num<<" x "<<i<<" = "<<mult<<endl;
	}
	
	return 0;
	system("pause");
}
