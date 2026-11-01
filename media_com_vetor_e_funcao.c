#include <stdio.h>

float calcular_media(const float notas[], int quantidade) {
    float soma = 0.0f;
    int i;

    for (i = 0; i < quantidade; i++) {
        soma += notas[i];
    }

    return soma / quantidade;
}

int main(void) {
    float notas[5];
    int i;

    for (i = 0; i < 5; i++) {
        printf("Digite a nota %d: ", i + 1);
        scanf("%f", &notas[i]);
    }

    printf("Media da turma: %.2f\n", calcular_media(notas, 5));
    return 0;
}
