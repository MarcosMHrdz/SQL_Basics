![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Laboratorio | Conceptos básicos de SQL (selección y agregación)

## Introducción

En esta práctica de laboratorio, utilizará la base de datos `files_for_lab/mysql_dump.sql`. Cárguelo en Sequel Pro y allí encontrará una base de datos "bancaria" que usaremos para el siguiente ejercicio.

Aquí practicaremos la selección y proyección de datos. Puedes terminar todas las preguntas solo con esas cláusulas:

-`SELECCIONAR`
- `SELECCIONAR DISTINTO`
- `DESDE`
- `DONDE`
- `ORDENAR POR`
- `LIMITE`

Puede guardar sus soluciones en un archivo `solutions.sql`.

## Instrucciones

Supongamos que cualquier columna `_id` es incremental, lo que significa que los identificadores más altos siempre aparecen después de los identificadores más bajos. Por ejemplo, un cliente con un "client_id" más alto se unió al banco después de un cliente con un "client_id" más bajo.

### Consulta 1

Obtenga los valores de "id" de los primeros 5 clientes de "district_id" con un valor igual a 1.

Resultado Esperado:

```cáscara
2
3
22
23
28
```

### Consulta 2

En la tabla "cliente", obtenga un valor de "id" del último cliente donde "district_id" es igual a 72.

Resultado Esperado:

```cáscara
13576
```

### Consulta 3

Obtenga los 3 montos más bajos en la tabla de "préstamos".

Resultado Esperado:

```cáscara
4980
5148
7656
```

### Consulta 4

¿Cuáles son los valores posibles para el "estado", ordenados alfabéticamente en orden ascendente en la tabla de "préstamo"?

Resultado Esperado:

```cáscara
A
B
C
D
```

### Consulta 5

¿Cuál es el `loan_id` del pago más alto recibido en la tabla de `loan`?

Resultado Esperado:

```cáscara
6312
```

### Consulta 6

¿Cuál es el "monto" del préstamo de los 5 "id_de_cuenta" más bajos en la tabla de "préstamos"? Mostrar el `account_id` y el `amount` correspondiente

Resultado Esperado:

```cáscara
#identificación cantidad
2 80952
19 30276
25 30276
37 318480
38 110736
```

### Consulta 7

¿Cuáles son los "account_id" con el "monto" de préstamo más bajo que tienen una "duración" de préstamo de 60 en la tabla de "préstamos"?

Resultado Esperado:

```cáscara
10954
938
10711
1766
10799
```

### Consulta 8

¿Cuáles son los valores únicos de `k_symbol` en la tabla `order`?

Nota: No debería haber un nombre de tabla "orden", ya que "orden" está reservado de la cláusula "ORDER BY". Debe utilizar comillas invertidas para escapar del nombre de la tabla "orden".

Resultado Esperado:

```cáscara
ARRENDAMIENTO
POJISTNE
SIPO
UVER
```

### Consulta 9

En la tabla "order", ¿cuáles son los "order_id" del cliente con el "account_id" 34?

Resultado Esperado:

```cáscara
29445
29446
29447
```

### Consulta 10

En la tabla "order", ¿qué "account_id" fueron responsables de los pedidos entre "order_id" 29540 y "order_id" 29560 (inclusive)?

Resultado Esperado:

```cáscara
88
90
96
97
```

### Consulta 11

En la tabla "order", ¿cuáles son los montos individuales que se enviaron a (`account_to`) id 30067122?

Resultado Esperado:

```cáscara
5123
```

### Consulta 12

En la tabla `trans`, muestre `trans_id`, `date`, `type` y `amount` de las 10 primeras transacciones de `account_id` 793 en orden cronológico, de la más nueva a la más antigua.

Resultado Esperado:

```cáscara
3556468 981231 PRIJEM 78.6
233254 981216 VYDAJ 600
233104 981212 VYDAJ 1212
233248 981211 VYDAJ 851
233176 981207 VYDAJ 204
3556467 981130 PRIJEM 75.1
233395 981130 VYDAJ 14.6
233103 981112 VYDAJ 1212
233247 981111 VYDAJ 851
233175 981107 VYDAJ 204
```

### Consulta 13

En la tabla "cliente", de todos los distritos con un "district_id" inferior a 10, ¿cuántos clientes hay de cada "district_id"? Muestra los resultados ordenados por `district_id` en orden ascendente.

Resultado Esperado:

```cáscara
1 663
2 46
3 63
4 50
5 71
6 53
7 45
8 69
9 60
```

### Consulta 14

En la tabla de "tarjetas", ¿cuántas tarjetas existen para cada "tipo"? Clasifique el resultado comenzando por el "tipo" más frecuente.

Resultado Esperado:

```cáscara
clásico 659
joven 145
oro 88
```

### Consulta 15

Usando la tabla de "préstamo", imprima los 10 principales "account_id" según la suma de todos los montos de sus préstamos.

Resultado Esperado:

```cáscara
7542 590820
8926 566640
2335 541200
817 538500
2936 504000
7049 495180
10451 482940
6950 475680
7966 473280
339 468060
```

### Consulta 16

En la tabla de "préstamos", recupere el número de préstamos emitidos para cada día, antes (excl) 930907, ordenados por fecha en orden descendente.

Resultado Esperado:

```
930906 1
930803 1
930728 1
930711 1
930705 1
```

### Consulta 17

En la tabla de "préstamos", para cada día de diciembre de 1997, cuente el número de préstamos emitidos para cada duración única del préstamo, ordenados por fecha y duración, ambos en orden ascendente. Puede ignorar los días sin préstamos en su salida.

Resultado Esperado:

```cáscara
971206 24 1
971206 36 1
971208 12 3
971209 12 1
971209 24 1
971210 12 1
971211 24 1
971211 48 1
971213 24 1
971220 36 1
971221 36 1
971224 60 1
971225 24 1
971225 60 1
```

### Consulta 18

En la tabla `trans`, para `account_id` 396, sume la cantidad de transacciones para cada tipo (`VYDAJ` = Saliente, `PRIJEM` = Entrante). Su salida debe tener el `account_id`, el `type` y la suma del monto, denominado `total_amount`. Ordenar alfabéticamente por tipo.

Resultado Esperado:

```cáscara
396 PRIJEM 1028138.6999740601
396 VYDAJ 1485814.400024414
```

### Consulta 19

Del resultado anterior, traduzca los valores de "tipo" al inglés, cambie el nombre de la columna a "tipo_transacción", redondee "monto_total" a un número entero

Resultado Esperado:

```cáscara
396 ENTRANTE 1028138
396 SALIENTE 1485814
```

### Consulta 20

A partir del resultado anterior, modifique su consulta para que devuelva solo una fila, con una columna para el monto entrante, el monto saliente y la diferencia.

Resultado Esperado:

```cáscara
396 1028138 1485814 -457676
```

### Consulta 21

Continuando con el ejemplo anterior, clasifique los 10 principales `account_id` según su diferencia.

Resultado Esperado:

```cáscara
9707 869527
3424 816372
3260 803055
2486 735219
1801 725382
4470 707243
3674 703531
9656 702786
2227 696564
6473 692580