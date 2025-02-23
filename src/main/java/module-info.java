module com.adacademy.dmtool {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.adacademy.dmtool to javafx.fxml;
    exports com.adacademy.dmtool;
}