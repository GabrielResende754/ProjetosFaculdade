#include <stdio.h>

int main(void) {
    double celsius, fahrenheit;

    printf("Temperatura em Celsius: ");
    scanf("%lf", &celsius);

    fahrenheit = (celsius * 9.0 / 5.0) + 32.0;
    printf("%.2lf Celsius = %.2lf Fahrenheit\n", celsius, fahrenheit);

    return 0;
}
