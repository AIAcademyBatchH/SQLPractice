/*
-- Standard Sytanx of Trigger...
CREATE [OR REPLACE] TRIGGER trigger_name
{BEFORE | AFTER } triggering_event ON table_name
[FOR EACH ROW]
[FOLLOWS | PRECEDES another_trigger]
[ENABLE / DISABLE ]
[WHEN condition]
DECLARE
    declaration statements
BEGIN
    executable statements
EXCEPTION
    exception_handling statements
END;
*/


CREATE TABLE audits (
      audit_id         NUMBER ,
      table_name       VARCHAR2(255),
      transaction_name VARCHAR2(10),
      by_user          VARCHAR2(30),
      transaction_date DATE
);



CREATE TABLE customers
  (
    customer_id NUMBER  ,
                    name         VARCHAR2( 255 ) NOT NULL,
    address      VARCHAR2( 255 )         ,
    website      VARCHAR2( 255 )         ,
    credit_limit NUMBER( 8, 2 )
  );
  
Insert into CUSTOMERS (CUSTOMER_ID,NAME,ADDRESS,CREDIT_LIMIT,WEBSITE) values (180,'INTL FCStone','5344 Haverford Ave, Philadelphia, PA',5000,'http://www.intlfcstone.com');
Insert into CUSTOMERS (CUSTOMER_ID,NAME,ADDRESS,CREDIT_LIMIT,WEBSITE) values (184,'Publix Super Markets','1795 Wu Meng, Muang Chonburi, ',1200,'http://www.publix.com');
Insert into CUSTOMERS (CUSTOMER_ID,NAME,ADDRESS,CREDIT_LIMIT,WEBSITE) values (187,'ConocoPhillips','Walpurgisstr 69, Munich, ',2400,'http://www.conocophillips.com');
Insert into CUSTOMERS (CUSTOMER_ID,NAME,ADDRESS,CREDIT_LIMIT,WEBSITE) values (190,'3M','Via Frenzy 6903, Roma, ',1200,'http://www.3m.com');
Insert into CUSTOMERS (CUSTOMER_ID,NAME,ADDRESS,CREDIT_LIMIT,WEBSITE) values (192,'Exelon','Via Luminosa 162, Firenze, ',500,'http://www.exeloncorp.com');
Insert into CUSTOMERS (CUSTOMER_ID,NAME,ADDRESS,CREDIT_LIMIT,WEBSITE) values (208,'Tesoro','Via Nriosa 1942, Firenze, ',500,'http://www.tsocorp.com');
;

commit;


CREATE OR REPLACE TRIGGER customers_audit_trg
    AFTER 
    UPDATE OR DELETE 
    ON customers
    FOR EACH ROW    
DECLARE
   l_transaction VARCHAR2(10);
BEGIN
   -- determine the transaction type
   l_transaction := CASE  
         WHEN UPDATING THEN 'UPDATE'
         WHEN DELETING THEN 'DELETE'
   END;

   -- insert a row into the audit table   
   INSERT INTO audits (table_name, transaction_name, by_user, transaction_date)
   VALUES('CUSTOMERS', l_transaction, USER, SYSDATE);
END;


  UPDATE
   customers
SET
   credit_limit = 2000
WHERE
   customer_id =10;
   
Commit; 


Select * from customers;
Select * from audits;
   