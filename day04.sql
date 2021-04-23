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
    �RNEK: ?lk harfi h, son harfi t olup 2.harfi a veya i olan 
    3 harfli kelimelerin t�m bilgilerini sorgulayal?m.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t');
 -------------------------------------------------------------------   
    /*
    �RNEK: ?lk harfi h, son harfi t olup 2.harfi a ile k aras?nda 
    olan 3 harfli kelimelerin t�m bilgilerini sorgulayal?m.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[a-k]t');
    
 ---------------------------------------------------------------------   
    /*�RNEK: ?�inde m veya i veya e olan kelimelerin t�m bilgilerini sorgulatal?m.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mie](*)');
 --------------------------------------------------------------------------   
    /*�RNEK: a ile veya s ile ba?layan kelimeler
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');
  -----------------------------------------------------------------------------  
    /*�RNEK: m ile veya f ile biten kelimeler
    */
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mf]$');
    
    
    
    
    
    
    
    
    
    