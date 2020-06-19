#include<iostream>

using namespace std;

int main(){
	double i;
	
	for(i = 0; i<101; i++){
		cout<<(i)<<endl;
	}

	
	i = 0;
	cout<<"---------------";	
	cout<<"---------------";
	cout<<"---------------";
	do{
		i+= 1;
		cout<<i<<endl;
	}while(i<101);
	
cout<<"---------------";	
cout<<"---------------";
cout<<"---------------";
	while(i<101){
		i=0;
		i++;
		cout<<i<<endl;
	}
	
		
	return 0;
	system("pause");
}
