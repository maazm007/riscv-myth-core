#include<stdio.h>
#include<math.h>
int main()
{
	unsigned long long int max = (unsigned long long int)(pow(2,116) * (-1));
	printf("The maximum unsigned number represented by unsigned long long int is %llu\n",max);
	return 0;
}
