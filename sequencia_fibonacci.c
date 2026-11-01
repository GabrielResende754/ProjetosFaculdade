#include <stdio.h>

int main(void) {
    int quantidade, i;
    unsigned long long primeiro = 0, segundo = 1, proximo;

    printf("Quantos termos deseja mostrar (1 a 93)? ");
    scanf("%d", &quantidade);

    if (quantidade < 1 || quantidade > 93) {
        printf("Quantidade invalida.\n");
        return 1;
    }

    for (i = 1; i <= quantidade; i++) {
        printf("%llu ", primeiro);
        proximo = primeiro + segundo;
        primeiro = segundo;
        segundo = proximo;
    }
    printf("\n");

    return 0;
}
