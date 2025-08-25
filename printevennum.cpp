#include <iostream>
using namespace std;

int main()
{

    for(int i = 2; i <= 20; i = i + 2)  // i+=2 == i = i +2;
    {
        // print even numbers from 2 to 20 including 20 its self
        cout << i << "\t";
    }

    // add end line after loop
    cout << endl;

   return 0;// signal to operating system everything works fine

}/** End of main function */
