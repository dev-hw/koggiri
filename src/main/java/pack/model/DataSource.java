package pack.model;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

@Repository
public class DataSource extends DriverManagerDataSource {
   public DataSource() {
      setDriverClassName("oracle.jdbc.driver.OracleDriver");
      setUrl("jdbc:oracle:thin:@127.0.0.1:1521:xe");
      setUsername("scott02");
      setPassword("tiger02");
   }
}