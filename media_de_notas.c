#include <stdio.h>

int main(void) {
    float nota1, nota2, nota3, media;

    printf("Digite tres notas: ");
    scanf("%f %f %f", &nota1, &nota2, &nota3);

    media = (nota1 + nota2 + nota3) / 3.0f;
    printf("Media: %.2f\n", media);

    if (media >= 7.0f) {
        printf("Aprovado!\n");
    } else if (media >= 5.0f) {
        printf("Recuperacao.\n");
    } else {
        printf("Reprovado.\n");
    }

    return 0;
}
