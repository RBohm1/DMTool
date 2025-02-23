package com.adacademy.dmtool.classes;

import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.stage.Modality;
import java.sql.*;

public class ItemManager {
    private Connection connect() {
        String url = "jdbc:mysql://localhost:8889/DMTool?user=root&password=root";
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    private void addItemPopup() {
        Stage popup = new Stage();
        popup.initModality(Modality.APPLICATION_MODAL);
        popup.setTitle("Nieuw Item");

        TextField nameField = new TextField();
        nameField.setPromptText("Naam");
        TextField descField = new TextField();
        descField.setPromptText("Beschrijving");
        TextField typeField = new TextField();
        typeField.setPromptText("Type");
        Button saveButton = new Button("Opslaan");

        saveButton.setOnAction(e -> {
            addItem(nameField.getText(), descField.getText(), typeField.getText());
            popup.close();
        });

        VBox layout = new VBox(10, nameField, descField, typeField, saveButton);
        Scene scene = new Scene(layout, 300, 200);
        popup.setScene(scene);
        popup.showAndWait();
    }

    private void editItemPopup(String oldName) {
        Stage popup = new Stage();
        popup.initModality(Modality.APPLICATION_MODAL);
        popup.setTitle("Item Bewerken");

        TextField nameField = new TextField(oldName);
        TextField descField = new TextField();
        descField.setPromptText("Nieuwe Beschrijving");
        TextField typeField = new TextField();
        typeField.setPromptText("Nieuw Type");
        Button saveButton = new Button("Opslaan");

        saveButton.setOnAction(e -> {
            updateItem(oldName, nameField.getText(), descField.getText(), typeField.getText());
            popup.close();
        });

        VBox layout = new VBox(10, nameField, descField, typeField, saveButton);
        Scene scene = new Scene(layout, 300, 200);
        popup.setScene(scene);
        popup.showAndWait();
    }

    private void addItem(String name, String description, String type) {
        String sql = "INSERT INTO Items(name, description, type) VALUES(?, ?, ?)";
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, description);
            pstmt.setString(3, type);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void updateItem(String oldName, String newName, String description, String type) {
        String sql = "UPDATE Items SET name = ?, description = ?, type = ? WHERE name = ?";
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, newName);
            pstmt.setString(2, description);
            pstmt.setString(3, type);
            pstmt.setString(4, oldName);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void deleteItem(String name) {
        String sql = "DELETE FROM Items WHERE name = ?";
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void start(Stage stage) {
        stage.setTitle("Itembeheer");

        // Titel
        Text title = new Text("Itembeheer");
        title.setFont(Font.font("PT Serif", 24));

        // Item lijst
        ListView<String> itemList = new ListView<>();

        // Knoppen
        Button addItemBtn = new Button("Nieuw item toevoegen");
        Button editItemBtn = new Button("Item bewerken");
        Button deleteItemBtn = new Button("Item verwijderen");
        Button backButton = new Button("Terug");

        // Functionaliteit koppelen
        addItemBtn.setOnAction(e -> addItemPopup());
        editItemBtn.setOnAction(e -> {
            String selectedItem = itemList.getSelectionModel().getSelectedItem();
            if (selectedItem != null) {
                editItemPopup(selectedItem);
            }
        });
        deleteItemBtn.setOnAction(e -> {
            String selectedItem = itemList.getSelectionModel().getSelectedItem();
            if (selectedItem != null) {
                deleteItem(selectedItem);
            }
        });

        // Styling
        addItemBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");
        editItemBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");
        deleteItemBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");
        backButton.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");

        // Layout
        VBox layout = new VBox(15);
        layout.getChildren().addAll(title, itemList, addItemBtn, editItemBtn, deleteItemBtn, backButton);
        layout.setStyle("-fx-background-color: #FFF5E1;");

        // Scene instellen
        Scene scene = new Scene(layout, 400, 300);
        stage.setScene(scene);
        stage.show();
    }
}

