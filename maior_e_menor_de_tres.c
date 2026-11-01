#include <stdio.h>

int main(void) {
    int a, b, c, maior, menor;

    printf("Digite tres numeros inteiros: ");
    scanf("%d %d %d", &a, &b, &c);

    maior = menor = a;

    if (b > maior) maior = b;
    if (c > maior) maior = c;
    if (b < menor) menor = b;
    if (c < menor) menor = c;

    printf("Maior: %d\n", maior);
    printf("Menor: %d\n", menor);

    return 0;
}
