#include <stdio.h>

int main(void) {
    int numero, divisor, eh_primo = 1;

    printf("Digite um numero inteiro: ");
    scanf("%d", &numero);

    if (numero <= 1) {
        eh_primo = 0;
    } else {
        for (divisor = 2; divisor * divisor <= numero; divisor++) {
            if (numero % divisor == 0) {
                eh_primo = 0;
                break;
            }
        }
    }

    if (eh_primo) {
        printf("%d e primo.\n", numero);
    } else {
        printf("%d nao e primo.\n", numero);
    }

    return 0;
}
