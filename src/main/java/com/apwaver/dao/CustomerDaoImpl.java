package com.apwaver.dao;

import com.apwaver.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class CustomerDaoImpl implements CustomerDao {

     // need to inject the session factory
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers() {

        // get the current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // create query ... sort by last Name
        Query query = session.createQuery("from Customer order by lastName", Customer.class);

        // execute query and get result list
        List<Customer> customers = query.getResultList();
        // return the results
        return customers;
    }

    @Override
    public void saveCustomer(Customer customer) {

        // get the current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // save customer
        session.saveOrUpdate(customer);

    }

    @Override
    public Customer getCustomer(int theId) {

        // get the current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // get Customer
        Customer customer = session.get(Customer.class,theId);

        return customer;
    }

    @Override
    public void deleteCustomer(int theId) {
        // get the current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // get Customer
        Customer customer = session.get(Customer.class,theId);

        // delete Customer
        session.delete(customer);
    }

    @Override
    public List<Customer> searchCustomers(String theSearchName) {
        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        Query theQuery = null;

        //
        // only search by name if theSearchName is not empty
        //
        if (theSearchName != null && theSearchName.trim().length() > 0) {

            // search for firstName or lastName ... case insensitive
            theQuery =currentSession.createQuery("from Customer where lower(firstName) like :theName or lower(lastName) like :theName", Customer.class);
            theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");

        }
        else {
            // theSearchName is empty ... so just get all customers
            theQuery =currentSession.createQuery("from Customer", Customer.class);
        }

        // execute query and get result list
        List<Customer> customers = theQuery.getResultList();

        // return the results
        return customers;

    }
}
