#include <iostream>
#include <string>
using namespace std;
#include "myPinyin.h"

int main()
{
	std::string str;
	str = GetChineseName("江子奔");   // str => "chun"
	std::cout << str << endl;
	return 0;

}
