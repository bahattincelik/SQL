--============= REGEXP_LIKE =============== 
 
    /* ======================= SELECT - REGEXP_LIKE ================================
    Daha karma??k pattern ile sorgulama i?lemi için REGEXP_LIKE kullan?labilir.  
?
    Syntax:
    --------
    REGEXP_LIKE(sutun_ad?, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    DROP TABLE kelimeler;
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1008, 'hct', 3);
    INSERT INTO kelimeler VALUES (1005, 'adem', 4);
    INSERT INTO kelimeler VALUES (1006, 'selim', 5);
    INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    /*
    ÖRNEK: ?lk harfi h, son harfi t olup 2.harfi a veya i olan 
    3 harfli kelimelerin tüm bilgilerini sorgulayal?m.
    */
    SELECT * FROM kelimeler;
    
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
 --------------------------------------------------------------------------   
  
    SELECT * FROM kelimeler;
    
    -- içerisinde 'hi' harfleri geçen kelimeleri sorgulayn?z.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- içerisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    --içerisinde ot veya at harfleri olan kelimeleri sorgulay?n?z.
    -- veya ilemi | karakteri ile yap?l?r. 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    -- hi veya ho ile ba?layan kelimeleri sorgulay?n?z.
    -- Ba?lama için ^ karakteri kullan?l?r.
    SELECT * FROM  kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho','i');
    
    -- t veya m ile biten kelimeleri Büyük-Küçük harf duyars?z ?ekilde listeyeniz.
    --biti? için $ ilareti kullan?l?r.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    
    -- h ile ba?lay?p t ile biten 3 harfli kelimeleri büyük-küçük harfe 
    -- dikkat etmeksizin listeleyeniz.
    -- - (tire) karakteri bir aral?k verir.
    -- kö?eli parantez tek bir karakter gösterir.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z0-9]t','i');
    
    -- ?lk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
    -- kelimelerin tüm bilgilerini sorgulayal?m.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    
    -- ?çinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    
    
    -- içerisinde en az 2 adet oo bar?nd?ran kelimelerin tüm bilgilerini 
    -- listeleyiniz.
    
    -- {2}
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[o]{2}','i'); 
  
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[a]{2}','i'); 
    
    
    
    
    
    
    
    
    