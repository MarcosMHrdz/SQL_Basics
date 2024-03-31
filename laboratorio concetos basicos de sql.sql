use bank;
-- Obtenga los idvalores de los primeros 5 clientes district_idcon un valor igual a 1.
SELECT
	client_id
FROM 
	bank.client
WHERE district_id = 1
ORDER BY client_id
LIMIT 5;
-- En la clienttabla, obtenga un idvalor del último cliente donde sea district_idigual a 72.
SELECT
	client_id
FROM 
	bank.client
WHERE district_id = 72
ORDER BY client_id desc
LIMIT 1;
-- Obtenga las 3 cantidades más bajas de la loantabla.
SELECT 	amount
FROM loan
ORDER BY amount asc
LIMIT 3; 
-- ¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la loantabla?
select distinct status
from loan 
order by status;
-- ¿ Cuál es el loan_idpago más alto recibido en la loantabla?
select loan_id
from loan
order by payments asc
limit 1;
-- ¿ Cuál es el préstamo amountde los 5 account_ids más bajos de la loantabla? Mostrar el account_idy el correspondienteamount
select account_id, amount
from loan 
order by account_id asc;
-- ¿Cuáles son los account_ids con el préstamo más bajo amountque tienen un préstamo durationde 60 en la loantabla?
select account_id
from loan
where duration = 60
order by amount 
limit 5;
-- ¿ Cuáles son los valores únicos de k_symbolen la ordertabla?
select distinct k_symbol
from bank.order;
-- En la ordertabla, ¿cuáles son los order_ids del cliente con el account_id34?
select order_id
from bank.order
where account_id = 34;
-- En la ordertabla, ¿cuáles account_id fueron responsables de los pedidos entre order_id29540 y order_id29560 (inclusive)?
select distinct account_id
from bank.order
where order_id between '29540' and '29560';

-- En la ordertabla, ¿cuáles son los montos individuales que se enviaron a ( account_to) id 30067122?

select distinct amount
from bank.order
where account_to = '30067122';

-- En la trans tabla, muestre las trans_id, y de las 10 primeras transacciones de 793 en orden cronológico, de la más nueva datea la más antigua.typeamountaccount_id

select trans_id, date, type, amount 
from bank.trans
where account_id = 793 
order by date desc
limit 10;

-- En la client tabla, de todos los distritos con district_id menos de 10, ¿cuántos clientes son de cada uno district_id? Muestra los resultados ordenados por district_iden orden ascendente.

SELECT district_id, COUNT(*) AS cantidad_de_clientes
FROM bank.client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;


-- En la cardtabla, ¿cuántas tarjetas existen para cada uno type? Clasifica el resultado empezando por el más frecuente type.

SELECT type, COUNT(card_id) as cantidad_por_tarjetas
FROM bank.card
GROUP BY type
order by cantidad_por_tarjetas desc;

-- Usando la loan tabla, imprima los 10 primeros account_id según la suma de todos los montos de sus préstamos.

select account_id, SUM(amount) AS Suma_amounts
from bank.loan;

-- En la loan Tabla, recupere el número de préstamos emitidos para cada día, antes de (excluido) 930907, ordenados por fecha en orden descendente.

SELECT date, count(loan_id) as numero_prestamos
FROM loan
WHERE date < 930907
GROUP BY DATE
ORDER BY DATE DESC;

-- En la loantabla, 
-- para cada día de diciembre de 1997, cuente el número de préstamos emitidos para cada duración de préstamo única, 
-- ordenados por fecha y duración, ambos en orden ascendente. Puede ignorar los días sin préstamos en su salida.

SELECT date, duration, COUNT(loan_id) AS cantidad_de_prestamos
FROM loan
WHERE date  between 971200 and 971231	 	
GROUP BY date, duration
ORDER BY date ASC, duration ASC;

-- En la trans tabla, para account_id 396, sume la cantidad de transacciones para cada tipo ( VYDAJ= Salientes, PRIJEM= Entrantes). 
-- Su salida debe tener el account_id, el typey la suma de la cantidad, denominados como total_amount. 
-- Ordenar alfabéticamente por tipo.


SELECT account_id,
       type,
       SUM(amount) AS total_amount
FROM trans
WHERE account_id = 396 
	AND type IN ('PRIJEM', 'VYDAJ')
GROUP BY account_id, type
ORDER BY type ASC;

-- Del resultado anterior, traduzca los valores de typeal inglés, 
-- cambie el nombre de la columna a transaction_type, redondee total_amounthacia abajo a un número entero

SELECT 
    account_id,
    CASE
        WHEN type = 'PRIJEM' THEN 'INCOMING'
        WHEN type = 'VYDAJ' THEN 'OUTGOING'
    END AS trans_type,
    FLOOR(SUM(amount)) AS total_amount
FROM trans
WHERE account_id = 396 
	AND type IN ('PRIJEM', 'VYDAJ')
GROUP BY account_id, type
ORDER BY type ASC;

-- A partir del resultado anterior, modifique su consulta para que devuelva solo una fila, 
-- con una columna para el monto entrante, el monto saliente y la diferencia.

SELECT 
    account_id,
    SUM(CASE WHEN type = 'INCOMING' THEN total_amount ELSE 0 END) AS monto_entrante,
    SUM(CASE WHEN type = 'OUTGOING' THEN total_amount ELSE 0 END) AS monto_saliente,
    SUM(CASE WHEN type = 'INCOMING' THEN total_amount ELSE -total_amount END) AS diferencia
FROM (
    SELECT 
        account_id,
        CASE
            WHEN type = 'PRIJEM' THEN 'INCOMING'
            WHEN type = 'VYDAJ' THEN 'OUTGOING'
        END AS type,
        FLOOR(SUM(amount)) AS total_amount
    FROM trans
    WHERE account_id = 396
      AND type IN ('PRIJEM', 'VYDAJ')
    GROUP BY account_id, type
) AS subquery
GROUP BY account_id
LIMIT 1;

-- Continuando con el ejemplo anterior, clasifique los 10 primeros account_idsegún su diferencia.

SELECT 
    account_id,
    SUM(CASE WHEN type = 'INCOMING' THEN total_amount ELSE -total_amount END) AS diferencia
FROM (
    SELECT 
        account_id,
        type,
        FLOOR(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE -amount END)) AS total_amount
    FROM trans
    WHERE type IN ('PRIJEM', 'VYDAJ')
    GROUP BY account_id, type
) AS subquery
GROUP BY account_id
ORDER BY diferencia asc
LIMIT 10;




