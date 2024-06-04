CREATE SCHEMA IF NOT EXISTS cargo_transport;

-- Таблица маршрутов
CREATE TABLE IF NOT EXISTS cargo_transport.routes (
    route_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    distance INTEGER NOT NULL,
    days INTEGER NOT NULL,
    base_payment NUMERIC(10, 2) NOT NULL
);

-- Таблица водителей
CREATE TABLE IF NOT EXISTS cargo_transport.drivers (
    driver_id SERIAL PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    patronymic VARCHAR(255),
    experience INTEGER NOT NULL
);

-- Таблица выполненных работ
CREATE TABLE IF NOT EXISTS cargo_transport.work_done (
    work_id SERIAL PRIMARY KEY,
    route_id INTEGER NOT NULL REFERENCES cargo_transport.routes(route_id),
    driver_id1 INTEGER NOT NULL REFERENCES cargo_transport.drivers(driver_id),
    driver_id2 INTEGER REFERENCES cargo_transport.drivers(driver_id),
    departure_date DATE NOT NULL,
    return_date DATE NOT NULL,
    bonus NUMERIC(10, 2)
);

-- Таблица оплаты водителей с учетом стажа
CREATE TABLE IF NOT EXISTS cargo_transport.driver_payments (
    driver_id INTEGER NOT NULL REFERENCES cargo_transport.drivers(driver_id),
    work_id INTEGER NOT NULL REFERENCES cargo_transport.work_done(work_id),
    payment NUMERIC(10, 2) NOT NULL
);


