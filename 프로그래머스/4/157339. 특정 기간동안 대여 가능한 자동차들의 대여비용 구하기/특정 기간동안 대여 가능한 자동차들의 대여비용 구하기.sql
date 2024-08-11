SELECT 
    A.CAR_ID, 
    A.CAR_TYPE, 
    ROUND(A.DAILY_FEE * ((100 - C.DISCOUNT_RATE) / 100) * 30) AS FEE
FROM 
    CAR_RENTAL_COMPANY_CAR A
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN C
        ON A.CAR_TYPE = C.CAR_TYPE 
        AND C.DURATION_TYPE = '30일 이상'
    LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B
        ON A.CAR_ID = B.CAR_ID
        AND B.START_DATE <= TO_DATE('2022-11-30', 'YYYY-MM-DD')
        AND B.END_DATE >= TO_DATE('2022-11-01', 'YYYY-MM-DD')
WHERE 
    A.CAR_TYPE IN ('세단', 'SUV')
    AND B.CAR_ID IS NULL 
    AND ROUND(A.DAILY_FEE * ((100 - C.DISCOUNT_RATE) / 100) * 30) BETWEEN 500000 AND 2000000
ORDER BY 
    FEE DESC, 
    A.CAR_TYPE ASC, 
    A.CAR_ID DESC;