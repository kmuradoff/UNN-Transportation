-- Триггер для вставки записей в таблицу оплат
CREATE OR REPLACE TRIGGER trg_calculate_payment
AFTER INSERT ON cargo_transport.work_done
FOR EACH ROW
EXECUTE FUNCTION cargo_transport.calculate_payment();
