package com.adacademy.dmtool;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.*;

public class DMToolUnitTests {

    private Connection connect() {
        String url = "jdbc:sqlite:dmtool.db";
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            fail("Database connection failed: " + e.getMessage());
        }
        return conn;
    }

    @Test
    void testDatabaseConnection() {
        Connection conn = connect();
        assertNotNull(conn, "Database connection should not be null");
    }

    @Test
    void testAddCharacter() {
        String sql = "INSERT INTO Characters(name, class, level, health, race) VALUES(?, ?, ?, ?, ?)";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "TestCharacter");
            pstmt.setString(2, "Warrior");
            pstmt.setInt(3, 1);
            pstmt.setInt(4, 100);
            pstmt.setString(5, "Human");
            int affectedRows = pstmt.executeUpdate();
            assertEquals(1, affectedRows, "One character should be added");
        } catch (SQLException e) {
            fail("Adding character failed: " + e.getMessage());
        }
    }

    @Test
    void testRetrieveItem() {
        String sql = "SELECT * FROM Items WHERE name = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "Zwaard");
            ResultSet rs = pstmt.executeQuery();
            assertTrue(rs.next(), "Item should exist in the database");
        } catch (SQLException e) {
            fail("Retrieving item failed: " + e.getMessage());
        }
    }

    @Test
    void testUpdateCharacterLevel() {
        String sql = "UPDATE Characters SET level = ? WHERE name = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, 5);
            pstmt.setString(2, "TestCharacter");
            int affectedRows = pstmt.executeUpdate();
            assertEquals(1, affectedRows, "Character level should be updated");
        } catch (SQLException e) {
            fail("Updating character level failed: " + e.getMessage());
        }
    }

    @Test
    void testDeleteCharacter() {
        String sql = "DELETE FROM Characters WHERE name = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "TestCharacter");
            int affectedRows = pstmt.executeUpdate();
            assertEquals(1, affectedRows, "One character should be deleted");
        } catch (SQLException e) {
            fail("Deleting character failed: " + e.getMessage());
        }
    }
}

