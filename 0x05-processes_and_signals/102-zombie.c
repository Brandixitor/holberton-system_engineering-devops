#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * infinite_while - A function that creates an infinite loop with 1 second sleep.
 *
 * Return: always 0 (success)
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - A function that creates 5 zombie processes.
 *
 * Return: always 0 (success)
 */

int main(void)
{
	pid_t zombie;
	int i;

	for (i = 0; i < 5; i++)
	{
		zombie = fork();
		if (zombie <= 0)
			exit(0);
		printf("Zombie process created, PID: %d\n", zombie);
	}
	infinite_while();
	return (0);
}
