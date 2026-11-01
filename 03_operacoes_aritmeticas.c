#include <stdio.h>

int main(void) {
    double a, b;

    printf("Digite dois numeros: ");
    scanf("%lf %lf", &a, &b);

    printf("Soma: %.2lf\n", a + b);
    printf("Subtracao: %.2lf\n", a - b);
    printf("Multiplicacao: %.2lf\n", a * b);

    if (b != 0) {
        printf("Divisao: %.2lf\n", a / b);
    } else {
        printf("Nao e possivel dividir por zero.\n");
    }

    return 0;
}
