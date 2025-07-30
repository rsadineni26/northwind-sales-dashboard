
-- Table: customers
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` longtext,
  `notes` longtext,
  `attachments` longblob,
  PRIMARY KEY (`id`)
);

-- Table: employee_privileges
CREATE TABLE `employee_privileges` (
  `employee_id` int NOT NULL,
  `privilege_id` int NOT NULL,
  PRIMARY KEY (`employee_id`, `privilege_id`)
);

-- Table: employees
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` longtext,
  `notes` longtext,
  `attachments` longblob,
  PRIMARY KEY (`id`)
);

-- Table: inventory_transaction_types
CREATE TABLE `inventory_transaction_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: inventory_transactions
CREATE TABLE `inventory_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` int DEFAULT NULL,
  `transaction_created_date` datetime DEFAULT NULL,
  `transaction_modified_date` datetime DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `purchase_order_id` int DEFAULT NULL,
  `customer_order_id` int DEFAULT NULL,
  `comments` longtext,
  PRIMARY KEY (`id`)
);

-- Table: invoices
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `tax` decimal(19,4) DEFAULT NULL,
  `shipping` decimal(19,4) DEFAULT NULL,
  `amount_due` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: order_details
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,4) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `date_allocated` datetime DEFAULT NULL,
  `purchase_order_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: order_details_status
CREATE TABLE `order_details_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: orders
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `shipper_id` int DEFAULT NULL,
  `ship_name` varchar(50) DEFAULT NULL,
  `ship_address` longtext,
  `ship_city` varchar(50) DEFAULT NULL,
  `ship_state_province` varchar(50) DEFAULT NULL,
  `ship_zip_postal_code` varchar(15) DEFAULT NULL,
  `ship_country_region` varchar(50) DEFAULT NULL,
  `shipping_fee` decimal(19,4) DEFAULT NULL,
  `taxes` decimal(19,4) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `notes` longtext,
  `tax_rate` double DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: orders_status
CREATE TABLE `orders_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: orders_tax_status
CREATE TABLE `orders_tax_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tax_status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: privileges
CREATE TABLE `privileges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: products
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(25) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `description` longtext,
  `standard_cost` decimal(19,4) DEFAULT NULL,
  `list_price` decimal(19,4) DEFAULT NULL,
  `reorder_level` int DEFAULT NULL,
  `target_level` int DEFAULT NULL,
  `quantity_per_unit` varchar(50) DEFAULT NULL,
  `discontinued` bit(1) DEFAULT NULL,
  `minimum_reorder_quantity` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `attachments` longblob,
  PRIMARY KEY (`id`)
);

-- Table: purchase_order_details
CREATE TABLE `purchase_order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_cost` decimal(19,4) DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `posted_to_inventory` bit(1) DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: purchase_order_status
CREATE TABLE `purchase_order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: purchase_orders
CREATE TABLE `purchase_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `submitted_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `expected_date` datetime DEFAULT NULL,
  `shipping_fee` decimal(19,4) DEFAULT NULL,
  `taxes` decimal(19,4) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,4) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`)
);

-- Table: sales_reports
CREATE TABLE `sales_reports` (
  `group_by` varchar(50) DEFAULT NULL,
  `display` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `filter_row_source` varchar(50) DEFAULT NULL,
  `default` bit(1) DEFAULT NULL
);

-- Table: shippers
CREATE TABLE `shippers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` longtext,
  `notes` longtext,
  `attachments` longblob,
  PRIMARY KEY (`id`)
);

-- Table: strings
CREATE TABLE `strings` (
  `string_id` varchar(255) NOT NULL,
  `string_data` longtext,
  PRIMARY KEY (`string_id`)
);

-- Table: suppliers
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` longtext,
  `notes` longtext,
  `attachments` longblob,
  PRIMARY KEY (`id`)
);
