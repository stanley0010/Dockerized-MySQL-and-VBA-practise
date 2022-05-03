INSERT INTO
    `countries` (`code`, `name`, `continent_name`)
VALUES
    (1, 'CHINA', 'A'),
    (2, 'USA', 'B'),
    (3, 'JAPAN', 'A'),
    (4, 'CANADA', 'B');

INSERT INTO
    `products` (
        `id`,
        `name`,
        `price`,
        `product_status`,
        `created_at`
    )
VALUES
    (
        1,
        'Airpod 1',
        1000,
        'in_stock',
        '2022-05-03 09:02:44'
    ),
    (
        2,
        'Airpod 2',
        1200,
        'running_low',
        '2022-05-03 09:03:20'
    ),
    (
        3,
        'iMac',
        10000,
        'in_stock',
        '2022-05-03 09:03:35'
    );

INSERT INTO
    `users` (`id`, `full_name`, `created_at`, `country_code`)
VALUES
    (1, 'User 1', '2022-05-03 09:01:36', 1),
    (2, 'User 2', '2022-05-03 09:01:57', 2);

INSERT INTO
    `orders` (`id`, `user_id`, `order_status`, `created_at`)
VALUES
    (1, 1, 'in_warehouse', '2022-05-03 09:04:24'),
    (2, 1, 'delivering', '2022-05-03 09:04:34'),
    (3, 2, 'in_warehouse', '2022-05-03 09:04:47');

INSERT INTO
    `order_items` (`order_id`, `product_id`, `quantity`)
VALUES
    (1, 1, 10),
    (2, 2, 2),
    (3, 3, 2);