package com.adacademy.dmtool.classes;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import java.sql.*;

public class CharacterManager {

    private Connection connect() {
        String url = "jdbc:mysql://localhost:8889/DMTool?user=root&password=root";
        Connection conn = connect();
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    private void createCharacter() {
        String sql = "INSERT INTO characters(name, class, level) VALUES(?, ?, ?)";
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "New Character");
            pstmt.setString(2, "Warrior");
            pstmt.setInt(3, 1);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void editCharacter() {
        String sql = "UPDATE characters SET level = ? WHERE name = ?";
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, 2);
            pstmt.setString(2, "New Character");
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void deleteCharacter(String name) {
        String sql = "DELETE FROM characters WHERE name = ?";
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private ObservableList<String> getCharacters() {
        ObservableList<String> characters = FXCollections.observableArrayList();
        String sql = "SELECT name FROM characters";
        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                characters.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return characters;
    }

    public void start(Stage stage) {
        stage.setTitle("Personagebeheer");

        // Titel
        Text title = new Text("Personagebeheer");
        title.setFont(Font.font("PT Serif", 24));

        // Lijstweergave van personages
        ListView<String> characterList = new ListView<>();
        characterList.setItems(getCharacters());

        // Knoppen
        Button createCharacterBtn = new Button("Nieuw personage");
        Button editCharacterBtn = new Button("Bewerk personage");
        Button deleteCharacterBtn = new Button("Verwijder geselecteerd personage");
        Button backButton = new Button("Terug");

        // Functionaliteit koppelen
        createCharacterBtn.setOnAction(e -> {
            createCharacter();
            characterList.setItems(getCharacters()); // Lijst vernieuwen
        });
        editCharacterBtn.setOnAction(e -> editCharacter());
        deleteCharacterBtn.setOnAction(e -> {
            String selectedCharacter = characterList.getSelectionModel().getSelectedItem();
            if (selectedCharacter != null) {
                deleteCharacter(selectedCharacter);
                characterList.setItems(getCharacters()); // Lijst vernieuwen
            }
        });

        // Styling
        createCharacterBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");
        editCharacterBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");
        deleteCharacterBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");
        backButton.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");

        // Layout
        VBox layout = new VBox(15);
        layout.getChildren().addAll(title, characterList, createCharacterBtn, editCharacterBtn, deleteCharacterBtn, backButton);
        layout.setStyle("-fx-background-color: #FFF5E1;");

        // Scene instellen
        Scene scene = new Scene(layout, 1200, 900);
        stage.setScene(scene);
        stage.show();
    }
}

