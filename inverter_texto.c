#include <stdio.h>
#include <string.h>

int main(void) {
    char texto[200];
    size_t tamanho, i;

    printf("Digite uma palavra ou frase: ");
    fgets(texto, sizeof(texto), stdin);

    texto[strcspn(texto, "\n")] = '\0'; // Remove o Enter lido pelo fgets.
    tamanho = strlen(texto);

    printf("Texto invertido: ");
    for (i = tamanho; i > 0; i--) {
        putchar(texto[i - 1]);
    }
    printf("\n");

    return 0;
}
