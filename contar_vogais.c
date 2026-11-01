#include <stdio.h>
#include <ctype.h>

int main(void) {
    char texto[200];
    int i, vogais = 0;

    printf("Digite uma frase (sem acentos para este exemplo): ");
    fgets(texto, sizeof(texto), stdin);

    for (i = 0; texto[i] != '\0'; i++) {
        char caractere = (char)tolower((unsigned char)texto[i]);

        if (caractere == 'a' || caractere == 'e' ||
            caractere == 'i' || caractere == 'o' ||
            caractere == 'u') {
            vogais++;
        }
    }

    printf("Quantidade de vogais: %d\n", vogais);
    return 0;
}
