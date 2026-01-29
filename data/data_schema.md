#  Food Delivery Platform – Data Schema

##  Overview
This project uses anonymized, CSV‑based data representing a food delivery platform.
The data is modeled using a **fact–dimension schema** to support scalable analytical queries
focused on operations, customer experience, and revenue impact.

---

## Fact Tables

### 1. `fact_orders`
Stores order‑level transactional information.

| Column Name | Description |
|------------|-------------|
| order_id | Unique identifier for each order |
| customer_id | Unique identifier for the customer |
| restaurant_id | Unique identifier for the restaurant |
| order_date | Date when the order was placed |
| total_amount | Total order value |
| is_cancelled | Indicates whether the order was cancelled (yes/no) |

---

### 2. `fact_delivery_performance`
Captures delivery execution and SLA performance.

| Column Name | Description |
|------------|-------------|
| order_id | Unique identifier for the order |
| delivery_partner_id | Unique identifier for delivery partner |
| expected_delivery_time_mins | Expected delivery time (minutes) |
| actual_delivery_time_mins | Actual delivery time (minutes) |

---

### 3. `fact_ratings`
Contains customer feedback data.

| Column Name | Description |
|------------|-------------|
| order_id | Unique identifier for the order |
| rating | Customer rating (1–5 scale) |

---

### 4. `fact_order_items` (Optional)
Stores item‑level details per order.

| Column Name | Description |
|------------|-------------|
| order_id | Unique identifier for the order |
| item_id | Unique identifier for the item |
| quantity | Quantity ordered |
| item_price | Price per item |

---

##  Dimension Tables

### 5. `dim_restaurant`
Provides contextual information about restaurants.

| Column Name | Description |
|------------|-------------|
| restaurant_id | Unique identifier for the restaurant |
| restaurant_name | Name of the restaurant |
| city | City where the restaurant operates |
| cuisine_type | Type of cuisine |

---

### 6. `dim_customer`
Stores customer details.

| Column Name | Description |
|------------|-------------|
| customer_id | Unique identifier for the customer |
| city | Customer location |

---

### 7. `dim_delivery_partner`
Contains delivery partner information.

| Column Name | Description |
|------------|-------------|
| delivery_partner_id | Unique identifier for delivery partner |
| partner_name | Delivery partner name |
| city | City of operation |


---

## 🔗 Key Relationships
- `fact_orders.restaurant_id` → `dim_restaurant.restaurant_id`
- `fact_orders.order_id` → `fact_delivery_performance.order_id`
- `fact_orders.order_id` → `fact_ratings.order_id`
- `fact_orders.customer_id` → `dim_customer.customer_id`
- `fact_orders.order_date` → `dim_date.date`

---

## Purpose of the Schema
This schema enables:
- City‑level performance analysis  
- Pricing and order value analysis  
- SLA and cancellation tracking  
- Customer experience and revenue impact analysis  

It reflects a **real‑world analytics data model** commonly used in food delivery and e‑commerce platforms.
