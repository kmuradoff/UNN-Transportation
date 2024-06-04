-- Представление для информации о маршрутах
CREATE VIEW cargo_transport.route_info AS
SELECT
    r.route_id,
    r.name,
    r.distance,
    r.days,
    r.base_payment
FROM
    cargo_transport.routes r;

-- Представление для информации о водителях
CREATE VIEW cargo_transport.driver_info AS
SELECT
    d.driver_id,
    d.last_name,
    d.first_name,
    d.patronymic,
    d.experience
FROM
    cargo_transport.drivers d;

-- Представление для информации о выполненных работах и оплате
CREATE VIEW cargo_transport.work_and_payment_info AS
SELECT
    wd.work_id,
    wd.route_id,
    wd.driver_id1,
    wd.driver_id2,
    wd.departure_date,
    wd.return_date,
    wd.bonus,
    dp.driver_id,
    dp.payment
FROM
    cargo_transport.work_done wd
JOIN
    cargo_transport.driver_payments dp ON wd.work_id = dp.work_id;



CREATE VIEW cargo_transport.total_driver_payments AS
SELECT * FROM cargo_transport.get_total_payments();


CREATE VIEW cargo_transport.work_and_payments AS
SELECT
    wd.work_id,
    wd.route_id,
    wd.driver_id1,
    wd.driver_id2,
    wd.departure_date,
    wd.return_date,
    wd.bonus,
    dp.driver_id,
    dp.payment
FROM
    cargo_transport.work_done wd
JOIN
    cargo_transport.driver_payments dp ON wd.work_id = dp.work_id;
