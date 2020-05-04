package com.bryl.springdemo.dao;
import com.bryl.springdemo.entity.Customer;

import java.util.List;

public interface CustomerDAO {
    List<Customer> getCustomers();
    void saveCustomer(Customer theCustomer);
    Customer getCustomer(int theId);
    void deleteCustomer(int theId);
}
