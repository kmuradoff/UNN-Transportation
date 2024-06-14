-- Триггер для вставки записей в таблицу оплат
CREATE OR REPLACE TRIGGER trg_calculate_payment
AFTER INSERT ON cargo_transport.work_done
FOR EACH ROW
EXECUTE FUNCTION cargo_transport.calculate_payment();

-- Триггер для логирования изменений трекингового номера
CREATE OR REPLACE TRIGGER trg_log_tracking_number_change
AFTER UPDATE ON cargo_transport.routes
FOR EACH ROW
EXECUTE FUNCTION cargo_transport.log_tracking_number_change();
