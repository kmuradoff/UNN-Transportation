-- Функция расчета оплаты водителям (Триггерная функция)
CREATE OR REPLACE FUNCTION cargo_transport.calculate_payment()
RETURNS TRIGGER AS $$
DECLARE
    experience_factor NUMERIC(10, 2);
    route_base_payment NUMERIC(10, 2);
BEGIN
    -- Определяем коэффициент стажа
    IF NEW.driver_id2 IS NULL THEN
        -- Если один водитель
        SELECT r.base_payment INTO route_base_payment
        FROM cargo_transport.routes r
        WHERE r.route_id = NEW.route_id;

        SELECT (d.experience / 10.0 + 1.0) INTO experience_factor
        FROM cargo_transport.drivers d
        WHERE d.driver_id = NEW.driver_id1;

        INSERT INTO cargo_transport.driver_payments (driver_id, work_id, payment)
        VALUES (NEW.driver_id1, NEW.work_id, route_base_payment * experience_factor + COALESCE(NEW.bonus, 0));
    ELSE
        -- Если два водителя
        SELECT r.base_payment INTO route_base_payment
        FROM cargo_transport.routes r
        WHERE r.route_id = NEW.route_id;

        SELECT (d.experience / 10.0 + 1.0) INTO experience_factor
        FROM cargo_transport.drivers d
        WHERE d.driver_id = NEW.driver_id1;

        INSERT INTO cargo_transport.driver_payments (driver_id, work_id, payment)
        VALUES (NEW.driver_id1, NEW.work_id, (route_base_payment / 2) * experience_factor + COALESCE(NEW.bonus, 0) / 2);

        SELECT (d.experience / 10.0 + 1.0) INTO experience_factor
        FROM cargo_transport.drivers d
        WHERE d.driver_id = NEW.driver_id2;

        INSERT INTO cargo_transport.driver_payments (driver_id, work_id, payment)
        VALUES (NEW.driver_id2, NEW.work_id, (route_base_payment / 2) * experience_factor + COALESCE(NEW.bonus, 0) / 2);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Функция для получения общих выплат водителей с устранением конфликта имен
CREATE OR REPLACE FUNCTION cargo_transport.get_total_payments()
RETURNS TABLE (driver_id INTEGER, total_payment NUMERIC(10, 2)) AS $$
BEGIN
    RETURN QUERY
    SELECT dp.driver_id, SUM(dp.payment) AS total_payment
    FROM cargo_transport.driver_payments dp
    GROUP BY dp.driver_id;
END;
$$ LANGUAGE plpgsql;
