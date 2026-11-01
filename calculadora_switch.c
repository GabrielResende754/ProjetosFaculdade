#include <stdio.h>

int main(void) {
    double a, b;
    char operacao;

    printf("Digite uma operacao (+, -, *, /): ");
    scanf(" %c", &operacao);

    printf("Digite dois numeros: ");
    scanf("%lf %lf", &a, &b);

    switch (operacao) {
        case '+':
            printf("Resultado: %.2lf\n", a + b);
            break;
        case '-':
            printf("Resultado: %.2lf\n", a - b);
            break;
        case '*':
            printf("Resultado: %.2lf\n", a * b);
            break;
        case '/':
            if (b != 0) {
                printf("Resultado: %.2lf\n", a / b);
            } else {
                printf("Erro: divisao por zero.\n");
            }
            break;
        default:
            printf("Operacao invalida.\n");
    }

    return 0;
}
