//Miembros del grupo: Marcos Tamburi - Nicolas Robles - Mariano Gerosa - Franco Balduini

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define maxClientes 10
#define maxOperaciones 10

int numPassCuenta[maxClientes][2];
char nombres[maxClientes][50];
float saldos[maxClientes];
bool estado[maxClientes];
int i, opc;

int opRealizadas = 0;

void depositoCuenta();
void extraccionCuenta();
void consultaSaldoCuenta();
void operacionesRalizadasSaldo();
char lineaDePuntos();
void definirArrays();

int main()
{
    definirArrays();

    do
    {
        int numCuentaIngresada, intentos = 0, passCuentaIngresada, encontrado = 0, user;
        opRealizadas = 0;
        do
        {
            lineaDePuntos();
            printf("Hola, bienvenido al sistema de cajero automatico \n");
            printf("Ingrese su n%cmero de cuenta: \n", 163);
            lineaDePuntos();
            scanf("%d", &numCuentaIngresada);
            lineaDePuntos();

            lineaDePuntos();
            printf("Ingrese la contrase%ca \n", 164);
            lineaDePuntos();
            scanf("%d", &passCuentaIngresada);
            lineaDePuntos();

            for (i = 0; i < maxClientes; i++)
            {
                if (numCuentaIngresada == numPassCuenta[i][1] && passCuentaIngresada == numPassCuenta[i][2])
                {
                    encontrado = 1;
                    user = i;
                }
            }

            intentos++;
            if (intentos == 3)
            {
                for (i = 0; i < maxClientes; i++)
                {
                    if (numCuentaIngresada == numPassCuenta[i][1])
                    {
                        estado[i] = false;
                    }
                }
            }

        } while (encontrado == 0 && intentos < 3);

        if (estado[user] == false)
        {
            lineaDePuntos();
            printf("Su cuenta ha sido bloqueada\nComun%cquese con la entidad bancaria para su restablecimiento\n", 161);
            lineaDePuntos();
        }

        while (encontrado == 1 && estado[user] == true)
        {
            do
            {

                if (opRealizadas <= maxOperaciones)
                {

                    lineaDePuntos();
                    printf("1-Dep%csito \n", 162);
                    printf("2-Extracci%cn \n", 162);
                    printf("3-Consultar saldo \n");
                    printf("4-Mostrar la cantidad de operaciones realizadas y el saldo actual \n");
                    printf("5-Salir\n");
                    lineaDePuntos();
                    scanf("%d", &opc);
                    lineaDePuntos();

                    switch (opc)
                    {
                    case 1:
                        depositoCuenta(saldos, user);
                        break;
                    case 2:
                        extraccionCuenta(saldos, user);
                        break;
                    case 3:
                        consultaSaldoCuenta(saldos, user);
                        break;
                    case 4:
                        operacionesRalizadasSaldo(saldos, user);
                        break;
                    case 5:
                        lineaDePuntos();
                        printf("\n\t\tHasta luego\n");
                        encontrado = 0;
                        break;
                    default:
                        printf("Opci%cn no v%clida \n", 162, 160);
                        break;
                    }
                }
                else
                {
                    lineaDePuntos();
                    printf("\nLleg%c al l%cmite de operaciones. Fin. Gracias!\n", 162, 161);
                    lineaDePuntos();
                    encontrado = 0;
                }

            } while (opc != 5 && opRealizadas < maxOperaciones);
        }

        do
        {
            printf("\n\n");
            lineaDePuntos();
            printf("Desea seguir realizando operaciones? 1-Si| 0-No \n");
            scanf("%d", &opc);
            lineaDePuntos();
        } while (opc <= 0 && opc >= 1);

    } while (opc != 0);

    system("pause");
    return 0;
}

void depositoCuenta(float arraySaldos[], int indice)
{
    float deposito = 0;
    lineaDePuntos();
    printf("Ingrese el dinero a depositar \n");
    lineaDePuntos();
    scanf("%f", &deposito);
    lineaDePuntos();
    arraySaldos[indice] += deposito;
    opRealizadas++;
}

void extraccionCuenta(float arraySaldos[], int indice)
{
    float extraccion = 0;
    lineaDePuntos();
    printf("Ingrese cuanto dinero desea retirar.\n");
    lineaDePuntos();
    scanf("%f", &extraccion);
    lineaDePuntos();

    if (extraccion < arraySaldos[indice])
    {
        arraySaldos[indice] -= extraccion;
        opRealizadas++;
    }
    else
    {
        printf("No se puede extraer mas plata de lo que tiene la cuenta\n");
    }
}

void consultaSaldoCuenta(float arraySaldos[], int indice)
{
    lineaDePuntos();
    printf("Aqui tienes el saldo disponible en la cuenta \n");
    lineaDePuntos();
    printf("%.2f\n", arraySaldos[indice]);
    lineaDePuntos();
    opRealizadas++;
}

void operacionesRalizadasSaldo(float arraySaldos[], int indice)
{
    lineaDePuntos();
    printf("La cantidad de operaciones realizadas son: %d\n", opRealizadas);
    printf("El saldo actual es de: $%.2f\n", arraySaldos[indice]);
    lineaDePuntos();
}

char lineaDePuntos()
{
    for (i = 0; i < 21; i++)
    {
        printf(" -");
    }
    printf("\n");
}

void definirArrays()
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

    // Saldo de los clientes
    saldos[0] = 0;
    saldos[1] = 0;
    saldos[2] = 0;
    saldos[3] = 0;
    saldos[4] = 0;
    saldos[5] = 0;
    saldos[6] = 0;
    saldos[7] = 0;
    saldos[8] = 0;
    saldos[9] = 0;
}