-- Вставка данных в таблицу локаций
INSERT INTO cargo_transport.locations (city, country, warehouse_name) VALUES
('Moscow', 'Russia', 'Warehouse A'),
('Saint Petersburg', 'Russia', 'Warehouse B'),
('Kazan', 'Russia', 'Warehouse C');

-- Вставка данных в таблицу маршрутов
INSERT INTO cargo_transport.routes (tracking_number, name, distance, days, base_payment, start_location_id, end_location_id) VALUES
('TRK001', 'Route A', 500, 2, 1000.00, 1, 2),
('TRK002', 'Route B', 1000, 4, 2000.00, 2, 3),
('TRK003', 'Route C', 1500, 6, 3000.00, 1, 3);

-- Вставка данных в таблицу водителей
INSERT INTO cargo_transport.drivers (last_name, first_name, patronymic, experience) VALUES
('Ivanov', 'Ivan', 'Ivanovich', 5),
('Petrov', 'Petr', 'Petrovich', 10),
('Sidorov', 'Sidr', 'Sidorovich', 15);

-- Вставка данных в таблицу марок машин
INSERT INTO cargo_transport.vehicle_brands (brand_name) VALUES
('Volvo'),
('Mercedes'),
('MAN');

-- Вставка данных в таблицу машин
INSERT INTO cargo_transport.vehicles (brand_id) VALUES
(1),
(2),
(3);

-- Вставка данных в таблицу выполненных работ
INSERT INTO cargo_transport.work_done (route_id, driver_id1, driver_id2, vehicle_id1, vehicle_id2, departure_date, return_date, bonus) VALUES
(1, 1, NULL, 1, NULL, '2024-05-01', '2024-05-03', 100.00),
(2, 2, 3, 2, 3, '2024-05-05', '2024-05-09', 200.00),
(3, 1, 2, 1, 2, '2024-05-10', '2024-05-16', 300.00);
