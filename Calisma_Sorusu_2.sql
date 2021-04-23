--========== CALISMA SORUSU - 2 =======================

/*
A?a??daki sorgular ile ayni sonucu veren alternatif sorgular yaz?n?z.

    SELECT *
    FROM ogrenciler
    WHERE yas>=8 AND yas<=17;

    SELECT *
    FROM ogrenciler
    WHERE yas<8 OR yas>17;

    SELECT *
    FROM ogrenciler
    WHERE yas = 6 OR yas = 7 OR yas = 8;
*/
------------------------------------------------------------------------
/*
    SELECT *
    FROM ogrenciler
    WHERE yas>=8 AND yas<=17;

*/

    SELECT *
    FROM ogrenciler
    WHERE yas BETWEEN '8' AND '17';
------------------------------------------------------------------------------
/*
    SELECT *
    FROM ogrenciler
    WHERE yas<8 OR yas>17;

*/
    SELECT *
    FROM ogrenciler
    WHERE yas NOT BETWEEN '8' AND '17';
------------------------------------------------------------------------------
/*
    SELECT *
    FROM ogrenciler
    WHERE yas = 6 OR yas = 7 OR yas = 8;

*/

    SELECT *
    FROM ogrenciler
    WHERE yas IN (6,7,8);
    
------------------------------------------------------------------
    
