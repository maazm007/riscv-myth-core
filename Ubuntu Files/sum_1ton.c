#include<stdio.h>
int main()
{
	int sum = 0;
	int n;
	printf("Enter the number : ");
	scanf("%d",&n);
	for(int i = 1;i <= n;i++)
	{
		sum += i;
	}
	printf("The value of sum of %d numbers are %d\n",n,sum);
	return 0;
}
