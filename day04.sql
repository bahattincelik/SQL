--============= REGEXP_LIKE =============== 
   
   
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO KEL?MELER VALUES (1001, 'hot', 3);
    INSERT INTO KEL?MELER VALUES (1002, 'hat', 3);
    INSERT INTO KEL?MELER VALUES (1003, 'hit', 3);
    INSERT INTO KEL?MELER VALUES (1004, 'hbt', 3);
    INSERT INTO KEL?MELER VALUES (1008, 'hct', 3);
    INSERT INTO KEL?MELER VALUES (1005, 'adem', 4);
    INSERT INTO KEL?MELER VALUES (1006, 'selim', 5);
    INSERT INTO KEL?MELER VALUES (1007, 'yusuf', 5);
    
    /*
    ÖRNEK: ?lk harfi h, son harfi t olup 2.harfi a veya i olan 
    3 harfli kelimelerin tüm bilgilerini sorgulayal?m.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t');
 -------------------------------------------------------------------   
    /*
    ÖRNEK: ?lk harfi h, son harfi t olup 2.harfi a ile k aras?nda 
    olan 3 harfli kelimelerin tüm bilgilerini sorgulayal?m.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[a-k]t');
    
 ---------------------------------------------------------------------   
    /*ÖRNEK: ?çinde m veya i veya e olan kelimelerin tüm bilgilerini sorgulatal?m.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mie](*)');
 --------------------------------------------------------------------------   
    /*ÖRNEK: a ile veya s ile ba?layan kelimeler
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');
  -----------------------------------------------------------------------------  
    /*ÖRNEK: m ile veya f ile biten kelimeler
    */
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mf]$');
    
    
    
    
    
    
    
    
    
    