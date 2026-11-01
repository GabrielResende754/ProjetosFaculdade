#include <stdio.h>

int main(void) {
    int numero, i;
    unsigned long long fatorial = 1;

    printf("Digite um numero entre 0 e 20: ");
    scanf("%d", &numero);

    if (numero < 0 || numero > 20) {
        printf("Valor fora do intervalo permitido.\n");
        return 1;
    }

    for (i = 2; i <= numero; i++) {
        fatorial *= (unsigned long long)i;
    }

    printf("%d! = %llu\n", numero, fatorial);
    return 0;
}
