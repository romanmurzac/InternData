# InternData
InternData repository is designed as a comprehensive guide for trainers facilitating the Big Data Internship Program. It provides a structured, day-by-day curriculum to help trainers mentor interns through a hands-on learning experience in data engineering, cloud technologies, and modern data practices.

## Goal
The repository serves as a centralized resource for trainers to:
* Follow a well-defined internship roadmap.
* Access daily learning objectives, activities, and expected outcomes.
* Guide participants through practical exercises, code examples, and project work.
* Monitor intern progress and provide feedback.
* Ensure consistency and quality across internship cohorts.

## Structure
Each day of the internship is organized into a dedicated folder (e.g., *day_01_01*, *day_01_02*, etc.), containing:
* A `README.md` with the day’s goals, instructions, and context.
* A `src/` folder with relevant code, scripts, and SQL files.
* A `materials/` (optional) folder with supporting materials such as diagrams, datasets, and templates.

In the `README.md` on each day the structure contains:
* **Title** - The overall name or theme of the session or document.
* **Day Schedule** - A time-based breakdown of the day's events.
* **Resources** - A curated list of supporting materials, typically external links or documents.
* **Theory** - An outline of the key conceptual and educational content to be covered.
* **Practice** - Any hands-on activities, exercises, or demos tied to the theoretical topics.

## Content
Break down on specific section and short description for each day activities.

### 1. Introduction
**[Week 01 - Day 01](./day_01_01/)** --- **Company Office** --- Participants will simulate their first day at InternIT: meet their mentor, get introduced to the team, explore the company’s mission, and understand the role of a Data Engineer in a fintech startup. They'll also review the internship roadmap and set up communication tools.\
**[Week 01 - Day 02](./day_01_02/)** --- **Project Setup** --- Participants will discuss project scenario and will install essential tools (Git, Python, PostgreSQL, pgAdmin, VS Code), create a GitHub repository and Cloud account, and set up a virtual environment. They'll also install dependencies and test their local setup.\
**[Week 01 - Day 03](./day_01_03/)** --- **Trends and Carriers in Data** --- Participants will explore current trends in data engineering, such as real-time analytics, data mesh, and cloud-native tools. They'll also research career paths, required skills, and reflect on their own learning goals.

### 2. Development Process
**[Week 01 - Day 04](./day_01_04/)** --- **Iterative Development** --- Participants will learn how to break down data projects into small, testable components. They'll practice writing and refining scripts in iterations, using Git for version control and documenting changes.\
**[Week 01 - Day 05](./day_01_05/)** --- **Agile Framework** --- Participants will simulate working in an Agile team: participate in a mock sprint planning, define user stories for a data pipeline, and track progress using a Kanban board or task tracker.

### 3. Database
**[Week 02 - Day 01](./day_02_01/)** --- **Hardware and Software** --- Participants will explore the hardware and software components that support database systems. They'll compare on-premise vs cloud-hosted databases, and review PostgreSQL installation, configuration, and performance considerations.\
**[Week 02 - Day 02](./day_02_02/)** --- **Connectivity and Integration in the Ecosystem** --- Participants will connect PostgreSQL to external tools (e.g., pgAdmin, Python, BI tools) and simulate data ingestion from APIs and CSV files. They'll also explore how databases integrate with other systems in a data pipeline.\
**[Week 02 - Day 03](./day_02_03/)** --- **Database Design, Scalability, and Administration** --- Participants will design relational schemas, define primary/foreign keys, and explore indexing strategies. They'll also simulate scaling scenarios and perform basic administrative tasks like user creation and backups.\
**[Week 02 - Day 04](./day_02_04/)** --- **Performance Optimization** --- Participants will analyze slow queries using EXPLAIN, create indexes, and compare execution plans. They'll also test performance improvements and document best practices for query tuning.

### 4. DevOps
**[Week 02 - Day 05](./day_02_05/)** --- **DevOps** --- Participants will learn how DevOps practices apply to data engineering. They'll write a basic CI/CD pipeline for a data project using GitHub Actions or similar tools, and explore containerization with Docker for reproducible environments.

### 5. Data Warehouse
**[Week 03 - Day 01](./day_03_01/)** --- **Introduction to Data Warehousing** --- Participants will learn the purpose of data warehouses and how they differ from operational databases. They'll explore use cases in banking and begin designing a basic warehouse schema.\
**[Week 03 - Day 02](./day_03_02/)** --- **Data Warehouse Architecture** --- Participants will implement a layered architecture (raw, staging, trusted) in PostgreSQL. They'll create schemas and simulate data movement between layers.\
**[Week 03 - Day 03](./day_03_03/)** --- **Normalization and Denormalization** --- Participants will apply normalization rules (1NF, 2NF, 3NF) to clean and structure data in the staging layer, and denormalize data in the trusted layer for analytics.\
**[Week 03 - Day 04](./day_03_04/)** --- **ETL/ELT Processes Models** --- Participants will run Python scripts to extract data from multiple sources, transform it into dimensional models, and load it into the data warehouse.\
**[Week 03 - Day 05](./day_03_05/)** --- **Data Governance** --- Participants will create PII and non-PII datasets, enforce data quality rules, manage data lifecycle (archiving/deletion), and review access control policies.

### 6. Cloud Solutions
**[Week 04 - Day 01](./day_03_05/)** --- **Introduction to Microsoft Azure** --- Participants will explore Azure services relevant to data engineering, such as Azure SQL, Blob Storage, and Data Factory. They'll set up a basic Azure environment.\
**[Week 04 - Day 02](./day_04_02/)** --- **Cloud Solutions and ETL in Azure Data Factory** --- Participants will build a cloud-based ETL pipeline using Azure Data Factory, connecting to cloud storage and transforming data in the cloud.\
**[Week 04 - Day 03](./day_04_03/)** --- **Distributed Processing with Spark** --- Participants will run distributed data processing jobs using PySpark, learning how Spark handles large-scale data across clusters.\
**[Week 04 - Day 04](./day_04_04/)** --- **Modern Data Stack** --- Participants will explore modern tools like dbt, Airflow, and cloud-native warehouses. They'll simulate a modern data pipeline using modular components.

### 7. Final Presentation
**[Week 04 - Day 05](./day_04_05/)** --- **Project Presentation** --- Participants will present their final project, showcasing the data pipeline they built, insights they generated, and lessons learned. They'll receive feedback from mentors and peers.

## Contribution
Every trainer is encouraged to contribute to the content of the current *Guide*.

Every trainer is encouraged to lead the specific day activities on it's own materials and pace. The main scope is to keep the structure of the day acttivities as they're planned to lead to a coherent final knowledge base.