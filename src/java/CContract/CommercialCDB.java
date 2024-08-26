package CContract;

import db.DBParameters;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.SQLException;

public class CommercialCDB {

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

    public String insert(CommercialC commercialC) throws SQLException {
        loadDriver(DBParameters.JDBC_DRIVER);
        Connection con = getConnection();
        String sql = "{call _CommercialContract(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}"; // Modified to include one more parameter
        String result = "Data Entered Successfully";

        try (CallableStatement ps = con.prepareCall(sql)) {
            ps.setString(1, commercialC.getagreementNo());
            ps.setString(2, commercialC.getreferenceId());
            ps.setString(3, commercialC.getdocumentNature());
            ps.setString(4, commercialC.getagreementType());
            ps.setString(5, commercialC.getagreementScope());
            ps.setString(6, commercialC.getdepartment());
            ps.setString(7, commercialC.getpartyName());
            ps.setString(8, commercialC.getexecutionDate());
            ps.setString(9, commercialC.getexpiryDate());
            ps.setString(10, commercialC.getcommencementType());
            ps.setString(11, commercialC.getcommencementDate());
            ps.setString(12, commercialC.getlocation());
            ps.setString(13, commercialC.getsecurityDeposits());
            ps.setString(14, commercialC.getrecipient1());
            ps.setString(15, commercialC.getrecipient2());
            ps.setString(16, commercialC.getrecipient3());
            ps.setString(17, commercialC.getrecipient4());
            ps.setString(18, commercialC.getrecipient5());
            ps.setString(19, commercialC.getrecipient6());
            ps.setString(20, commercialC.getadditionalList());
            ps.setString(21, commercialC.getuploadFile1());
            ps.setString(22, commercialC.getuploadFile2());
            ps.setString(23, commercialC.getuploadFile3());
            ps.setString(24, commercialC.getuploadFile4());
            ps.setString(25, commercialC.getuploadFile5());
            ps.setString(26, commercialC.getremarks());
            ps.setString(27, commercialC.getContractType());  // Set contractType
            ps.setString(28, commercialC.getlicenseFees());
            ps.setString(29, commercialC.getcamChargesC());
            ps.setString(30, commercialC.getutility());
            ps.setString(31, commercialC.getrevenueShare());
            ps.setString(32, commercialC.getmmg());
            ps.setString(33, commercialC.getpromotionalCharges());
            ps.setString(34, commercialC.getloading());
            ps.setString(35, commercialC.getbackOf());
            ps.setString(36, commercialC.getdeviation());
            ps.setString(37, commercialC.getdataEnteredBy());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            result = "Data Not Entered Successfully";
            e.printStackTrace();
        }

        return result;
    }
}
