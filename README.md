# Vet Clinic Database
    The project uses a relational database to create data structure for a vet clinic.Some slow queries was optimized in the database by using indexing.
    The goal of this project was to solve some performance issues, first, we introduced those issues. In order to do that:- 

1.  We populated the database with a significant number of data.
2.  Then the queries that take too much time (1 sec = 1000ms which can be considered as too much time for database query).
3.  We used EXPLAIN ANALYZE on the previous queries to check what is happening.

**SCREENSHOTS BEFORE OPTIMIZING QUERIES**

![Execution Time](https://user-images.githubusercontent.com/66526480/172251669-5c2d58c9-1129-4f85-90d0-965385fe026f.PNG)
![run time 2](https://user-images.githubusercontent.com/66526480/172251662-a88d72ec-4582-499a-b944-39bb0f8520fc.PNG)
![run time 3](https://user-images.githubusercontent.com/66526480/172251667-19e55a46-f412-4776-ab1a-1ddfef353955.PNG)


4. We improved the execution time of the queries by using indexing.

**SCREENSHOTS AFTER OPTIMIZATION**

![Re run 2](https://user-images.githubusercontent.com/66526480/172252184-00787e2b-59ac-4fec-93b6-93f5095a3705.PNG)
![rerun 3](https://user-images.githubusercontent.com/66526480/172252180-14287b4d-c78b-4418-9e06-5ad24bef95ee.PNG)
![rerun 4](https://user-images.githubusercontent.com/66526480/172252171-89db9008-7e2e-454a-b4e4-22e38d350135.PNG)

5. Database schema was updated to the schema.sql file. 


## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important 

## Authors

👤 **Author1**

- GitHub: [@githubhandle](https://github.com/AminaBuhari)
- Twitter: [@twitterhandle](https://twitter.com/AminaBuhari)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/amina-buhari/)

👤 **Author1**

- GitHub: [@githubhandle](https://github.com/TesheMaximillan)
- Twitter: [@twitterhandle](https://twitter.com/TesheKura)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/teshome-kurabachew-aa8067180/)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
