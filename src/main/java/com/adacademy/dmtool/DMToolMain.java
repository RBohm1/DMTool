package com.adacademy.dmtool;

import javafx.application.Application;
import com.adacademy.dmtool.classes.CharacterManager;
import com.adacademy.dmtool.classes.ItemManager;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class DMToolMain extends Application {
    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Dungeon Master Tool");


        Text title = new Text("Dungeon Master Tool");
        title.setFont(Font.font("PT Serif", 24));


        Button characterManagerBtn = new Button("Personagebeheer");
        Button itemManagerBtn = new Button("Itembeheer");

        // Styling voor knoppen
        characterManagerBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");
        itemManagerBtn.setStyle("-fx-background-color: #D2B48C; -fx-font-size: 14px;");

        // Functionaliteit voor buttons koppelen
        characterManagerBtn.setOnAction(e -> {
            CharacterManager characterManager = new CharacterManager();
            Stage characterStage = new Stage();
            characterManager.start(characterStage);
        });

        itemManagerBtn.setOnAction(e -> {
            ItemManager itemManager = new ItemManager();
            Stage itemStage = new Stage();
            itemManager.start(itemStage);
        });

        // VBox om knoppen links te plaatsen
        VBox buttonLayout = new VBox(15);
        buttonLayout.getChildren().addAll(characterManagerBtn, itemManagerBtn );
        buttonLayout.setAlignment(Pos.TOP_LEFT);
        buttonLayout.setStyle("-fx-padding: 20px;");

        // Hoofdlayout
        HBox mainLayout = new HBox();
        mainLayout.getChildren().addAll(title, buttonLayout);
        mainLayout.setStyle("-fx-background-color: #FFF5E1;");

        // Scene instellen
        Scene scene = new Scene(mainLayout, 800, 400);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
