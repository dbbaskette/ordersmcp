package com.baskettecase.ordersmcp.repository;

import com.baskettecase.ordersmcp.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Customer entity operations.
 * Provides data access methods for customer-related queries.
 */
@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

    /**
     * Find customer by email address.
     *
     * @param email the email address to search for
     * @return Optional containing the customer if found
     */
    Optional<Customer> findByEmail(String email);

    /**
     * Find customers by first name and last name.
     *
     * @param firstName the first name to search for
     * @param lastName the last name to search for
     * @return List of customers matching the criteria
     */
    List<Customer> findByFirstNameAndLastName(String firstName, String lastName);

    /**
     * Find customers by first name containing the given string (case-insensitive).
     *
     * @param firstName the first name pattern to search for
     * @return List of customers matching the criteria
     */
    List<Customer> findByFirstNameContainingIgnoreCase(String firstName);

    /**
     * Find customers by last name containing the given string (case-insensitive).
     *
     * @param lastName the last name pattern to search for
     * @return List of customers matching the criteria
     */
    List<Customer> findByLastNameContainingIgnoreCase(String lastName);

    /**
     * Find customers by email containing the given string (case-insensitive).
     *
     * @param email the email pattern to search for
     * @return List of customers matching the criteria
     */
    List<Customer> findByEmailContainingIgnoreCase(String email);

    /**
     * Check if a customer exists by email.
     *
     * @param email the email address to check
     * @return true if customer exists, false otherwise
     */
    boolean existsByEmail(String email);

    /**
     * Find customers with orders.
     * Uses a custom query to find customers who have placed at least one order.
     *
     * @return List of customers who have orders
     */
    @Query("SELECT DISTINCT c FROM Customer c JOIN c.orders o")
    List<Customer> findCustomersWithOrders();

    /**
     * Find customer by ID with orders and order details.
     * Uses a custom query to eagerly fetch orders and their details.
     *
     * @param customerId the customer ID to search for
     * @return Optional containing the customer with orders if found
     */
    @Query("SELECT c FROM Customer c " +
           "LEFT JOIN FETCH c.orders o " +
           "LEFT JOIN FETCH o.orderDetails od " +
           "WHERE c.customerId = :customerId")
    Optional<Customer> findByIdWithOrdersAndDetails(@Param("customerId") Long customerId);
} 