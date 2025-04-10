set serveroutput on ;
--2
create or replace trigger departement_inserted 
after INSERT on dept for each row
Declare 

Begin 

dbms_output.put_line('Un nouveau departement a ete ajoute : '|| :new.numdept);
End;
/


--3
create or replace trigger Director_updated 
Before update of directeur on dept for each row 
Declare 
begin 
dbms_output.put_line('Le ancien directeur est : '|| :old.directeur ||' a ete modifie en : '|| :new.directeur);
end;
/
--4
create or replace trigger departement_deleted
before delete on dept for each row 
declare 
begin 
dbms_output.put_line('Le departement a ete supprime : '|| :old.numdept);    
end;
/

--7

create or replace trigger salary_updated
before update of salaire on emp 
declare 
begin 
    if (:new.salaire > 1000) then
        dbms_output.put_line(rfad(':old',10)||(':new',10));
        dbms_output.put_line(rfad(:old.salaire,10)||(:new.salaire,10));
    end if ; 
end ; 
/


--8
create or replace trigger salary_updated
before update of salaire on emp 
when (new.salaire < 500)
declare
    e Exception ;
begin 
    raise e ;
Exception 
    when e then 
        dbms_output.put_line('Error occured!    ') ;
end ;
/