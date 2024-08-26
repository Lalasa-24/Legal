package SMailTrigger;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import db.DBParameters;

public class SDatabaseUtil {

    public static List<SContract> getContracts() {
        List<SContract> contracts = new ArrayList<>();
        String query = "{call MailTriggerServiceContracts}";

        try (Connection conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);
             CallableStatement stmt = conn.prepareCall(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String agreementNo = rs.getString("agreementNo");
                Date expiryDate = rs.getDate("expiryDate");
                String documentNature = rs.getString("documentNature");
                String agreementType = rs.getString("agreementType");
                String partyName = rs.getString("partyName");
                Date executionDate = rs.getDate("executionDate");
                String agreementStatus = rs.getString("agreementStatus");
                contracts.add(new SContract(agreementNo, expiryDate, documentNature, agreementType, partyName, executionDate, agreementStatus));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contracts;
    }
}
