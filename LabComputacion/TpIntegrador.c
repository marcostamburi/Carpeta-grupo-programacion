#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define maxClientes 10

int numPassCuenta[maxClientes][2];
char nombres[maxClientes][50];
float saldos[maxClientes];
bool estado[maxClientes];
int i, opc;

void depositoCuenta();
void extraccionCuenta();
void consultaSaldoCuenta();
void operacionesRalizadasSaldo();

int main()
{
    // Nro de cuenta
    numPassCuenta[0][1] = 10;
    numPassCuenta[1][1] = 20;
    numPassCuenta[2][1] = 30;
    numPassCuenta[3][1] = 40;
    numPassCuenta[4][1] = 50;
    numPassCuenta[5][1] = 60;
    numPassCuenta[6][1] = 70;
    numPassCuenta[7][1] = 80;
    numPassCuenta[8][1] = 90;
    numPassCuenta[9][1] = 100;

    // contraseña
    numPassCuenta[0][2] = 110;
    numPassCuenta[1][2] = 120;
    numPassCuenta[2][2] = 130;
    numPassCuenta[3][2] = 140;
    numPassCuenta[4][2] = 150;
    numPassCuenta[5][2] = 160;
    numPassCuenta[6][2] = 170;
    numPassCuenta[7][2] = 180;
    numPassCuenta[8][2] = 190;
    numPassCuenta[9][2] = 200;

    // Estado de la cuenta
    estado[0] = true;
    estado[1] = true;
    estado[2] = true;
    estado[3] = true;
    estado[4] = true;
    estado[5] = true;
    estado[6] = true;
    estado[7] = true;
    estado[8] = true;
    estado[9] = true;


    int numCuentaIngresada, intentos = 0, passCuentaIngresada, encontrado = 0, user;

    printf("Hola, bienvenido al sistema de cajero automatico \n");

    do
    {
        printf("Ingrese su n%cmero de cuenta: \n", 163);
        scanf("%d", &numCuentaIngresada);

        printf("Ingrese la contrase%ca \n", 164);
        scanf("%d", &passCuentaIngresada);

        for (i = 0; i < maxClientes; i++)
        {
            if (numCuentaIngresada == numPassCuenta[i][1] && passCuentaIngresada == numPassCuenta[i][2])
            {
                encontrado = 1;
                user = i;
            }
        }
        intentos++;
    } while (encontrado == 0 && intentos < 3);

    while (encontrado == 1 && estado[user] == true)
    {
        do
        {
            printf("1-Dep%csito \n", 162);
            printf("2-Extracci%cn \n", 162);
            printf("3-Consultar saldo \n");
            printf("4-Mostrar la cantidad de operaciones realizadas y el saldo actual \n");
            printf("5-Salir\n");
            scanf("%d", &opc);

            switch (opc)
            {
            case 1:
                depositoCuenta();
                break;
            case 2:
                extraccionCuenta();
                break;
            case 3:
                consultaSaldoCuenta();
                break;
            case 4:
                operacionesRalizadasSaldo();
                break;
            default:
                printf("Opcion no valida \n");
                break;
            }
        } while (opc != 5);
    }

    return 0;
}

void depositoCuenta()
{
}

void extraccionCuenta()
{
}

void consultaSaldoCuenta()
{
}

void operacionesRalizadasSaldo()
{
}