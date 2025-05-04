package com.example.demo.entity;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class UserTest {

    @Test
    void testUserCreation() {
        User user = new User();
        user.setName("Test User");
        user.setEmail("test@example.com");

        assertEquals("Test User", user.getName());
        assertEquals("test@example.com", user.getEmail());
    }

    @Test
    void testUserEquality() {
        User user1 = new User();
        user1.setName("Test User");
        user1.setEmail("test@example.com");

        User user2 = new User();
        user2.setName("Test User");
        user2.setEmail("test@example.com");

        assertEquals(user1, user2);
        assertEquals(user1.hashCode(), user2.hashCode());
    }

    @Test
    void testUserToString() {
        User user = new User();
        user.setName("Test User");
        user.setEmail("test@example.com");

        String toString = user.toString();
        assertTrue(toString.contains("Test User"));
        assertTrue(toString.contains("test@example.com"));
    }
} 