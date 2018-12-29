package com.apwaver.dao;

import com.apwaver.entity.Customer;

import java.util.List;

public interface CustomerDao {

    public List<Customer> getCustomers();

    public void saveCustomer(Customer customer);


    Customer getCustomer(int theId);

    void deleteCustomer(int theId);
}
