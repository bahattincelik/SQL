/* ============================== UPDATE SET ===================================    
    
 ?lk olarak a?a??daki gibi tedarikciler ad?nda bir tablo olu?turunu ve 
   vergi_no sutununu primary key yap?n?z.Ay?ra a???daki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonras?nda a?a??daki gibi urunler ad?nda bir ba?ka tablo olu?turunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutular?
    yard?m?yla ili?ki kurunuz. Verileri giriniz.
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay?e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y?lmaz');
    
==============================================================================*/
    
    CREATE TABLE tedarikciler
    (
      vergi_no NUMBER(3),
      firma_ismi VARCHAR2(50),
      irtibat_ismi VARCHAR2(50),  
      CONSTRAINT p_k PRIMARY KEY (vergi_no)
    
    );
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    SELECT * FROM tedarikciler;
    
    CREATE TABLE urunler2
    (
        ted_vergino NUMBER(3) , 
        urun_id NUMBER(11), 
        urun_isim VARCHAR2(50), 
        musteri_isim VARCHAR2(50),    
        CONSTRAINT urun_fk FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    
    INSERT INTO urunler2 VALUES(101, 1001,'Laptop', 'Ay?e Can');
    INSERT INTO urunler2 VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler2 VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler2 VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler2 VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler2 VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler2 VALUES(104, 1007,'Phone', 'Aslan Y?lmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler2;
        
        
        
        
        
        
        
        
        
        
        
        