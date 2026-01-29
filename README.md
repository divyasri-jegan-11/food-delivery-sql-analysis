#  Food Delivery Platform Analytics

## Problem Statement
The food delivery platform operates across multiple cities with high order volumes and a large network of restaurants and delivery partners.
However, despite strong demand, the business faces persistent challenges such as **order cancellations, delivery delays, SLA breaches, and declining customer ratings,** all of which contribute to hidden revenue loss.

The key challenge is not demand generation, but inefficiencies in operations that negatively affect customer experience and revenue realization.

## Project Overview
This project analyzes a food delivery platform using **SQL‑driven analytics** to identify
operational inefficiencies, customer experience issues, and revenue leakage.

The goal of the analysis is to demonstrate how data analytics can support
**business decision‑making** by connecting operations → customer experience → revenue impact.

---

##  Business Problem
The food delivery platform operates across multiple cities with a large network of restaurants
and delivery partners. Despite high order volumes, the platform faces challenges such as:
- High order cancellations
- Delivery delays (SLA breaches)
- Declining customer ratings
- Potential revenue loss

This project aims to diagnose **where the problems occur, why they occur, and how much they cost the business**.

---

##  Analytical Framework
The analysis is structured into **four business-focused blocks**:

1. **Platform Supply & Presence**  
   Understanding restaurant and delivery partner distribution across cities.

2. **Pricing & Order Value (AOV)**  
   Analyzing customer spending behavior and pricing power across cities and cuisines.

3. **Operational Efficiency**  
   Measuring cancellations, delivery delays, and SLA breaches.

4. **Customer Experience & Revenue Impact**  
   Evaluating ratings and estimating revenue loss due to cancellations.

---

##  Insights from the analysis
- The analysis reveals that **platform demand and revenue are highly concentrated in metro cities**, with Bengaluru emerging as the primary revenue and order‑volume driver, followed by Mumbai and Delhi. While these cities generate strong demand, mid‑tier cities show signs of **under‑monetization**, indicating untapped revenue potential.

- Average Order Value varies across cities, with high‑volume locations relying more on **order quantity rather than higher basket value**. This suggests price sensitivity and heavy discounting, limiting revenue scalability despite strong demand.

- Cancellation rates remain consistently high across cities, indicating **system‑wide operational issues rather than isolated problems**. High‑demand cities contribute the most to absolute revenue loss due to their large order volumes.

- Delivery time analysis shows that **longer delivery durations and SLA breaches are directly associated with lower customer ratings**. This establishes a clear link between operational performance and customer experience.

- Overall, the findings demonstrate a strong relationship between **delivery efficiency, customer satisfaction, and revenue realization**, where operational inefficiencies directly suppress business value.

---

##  Tools & Technologies Used
- **SQL** – Core data analysis and business logic
- **Python (Google Colab)** – Data exploration and query execution
- **Power BI** – 1‑page executive dashboard
- **Notion** – Project documentation and storytelling

---

##  Data Schema
The project uses anonymized CSV‑based data modeled using fact and dimension tables.

- Fact tables store transactional and operational data
- Dimension tables provide contextual information (city, restaurant, customer, delivery partner)

Detailed schema documentation is available in `data/data_schema.md`.

---


## 🔗 Documentation
Detailed analysis, insights, and explanations are documented in Notion.  
🔗 [Food-Delivery-Analytics](https://www.notion.so/Food-Delivery-Crisis-Recovery-Analytics-260c4eacd6ff80909253c169a6664326?source=copy_link)


---

## 👤 Author
**Divyasri J**  
Data Analyst | SQL | Power BI | Python
