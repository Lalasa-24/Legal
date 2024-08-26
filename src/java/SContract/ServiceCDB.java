






package SContract;

import db.DBParameters;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.CallableStatement;
import java.sql.SQLException;

public class ServiceCDB {

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);
    }

    public String insert(ServiceC serviceC) throws SQLException {
        loadDriver(DBParameters.JDBC_DRIVER);
        Connection con = getConnection();
        String sql = "{call _ServiceContract(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        String result = "Data Entered Successfully";

        try (CallableStatement ps = con.prepareCall(sql)) {
            ps.setString(1, serviceC.getagreementNo());
            ps.setString(2, serviceC.getreferenceId());
            ps.setString(3, serviceC.getdocumentNature());
            ps.setString(4, serviceC.getagreementType());
            ps.setString(5, serviceC.getagreementScope());
            ps.setString(6, serviceC.getdepartment());
            ps.setString(7, serviceC.getpartyName());
            ps.setString(8, serviceC.getexecutionDate());
            ps.setString(9, serviceC.getexpiryDate());
            ps.setString(10, serviceC.getcommencementType());
            ps.setString(11, serviceC.getcommencementDate());
            ps.setString(12, serviceC.getlocation());
            ps.setString(13, serviceC.getsecurityDeposits());
            ps.setString(14, serviceC.getrecipient1());
            ps.setString(15, serviceC.getrecipient2());
            ps.setString(16, serviceC.getrecipient3());
            ps.setString(17, serviceC.getrecipient4());
            ps.setString(18, serviceC.getrecipient5());
            ps.setString(19, serviceC.getrecipient6());
            ps.setString(20, serviceC.getadditionalList());
            ps.setString(21, serviceC.getuploadFile1());
            ps.setString(22, serviceC.getuploadFile2());
            ps.setString(23, serviceC.getuploadFile3());
            ps.setString(24, serviceC.getuploadFile4());
            ps.setString(25, serviceC.getuploadFile5());
            ps.setString(26, serviceC.getremarks());
            ps.setString(27, serviceC.getContractType());  // Set contractType
            ps.setString(28, serviceC.getserviceCharges());
            ps.setString(29, serviceC.getcamChargesS());
            ps.setString(30, serviceC.getutilityChargesS());
            ps.setString(31, serviceC.getperformanceBG());
            ps.setString(32, serviceC.getretentionBG());
            ps.setString(33, serviceC.getadavnceBG());
            ps.setString(34, serviceC.getdefectLiability());
            ps.setString(35, serviceC.getlatentDefectL());
            ps.setString(36, serviceC.getliquidatedDamages());
            ps.setString(37, serviceC.getdataEnteredBy());

            ps.executeUpdate();
        } catch (SQLException e) {
            result = "Data Not Entered Successfully";
            e.printStackTrace();
        }

        return result;
    }
}
