#include<iostream>

using namespace std;

int main(int argv, char** argc){
	
	int x, y, z;
	
	x=1;
	y= ++x;
	z=y++;
	
	cout<<"Os valores de x, y e z são: "<<x<<y<<z;
	
	
	system("pause");
	return 0;
}
