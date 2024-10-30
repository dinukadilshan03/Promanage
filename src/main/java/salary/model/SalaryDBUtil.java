package salary.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SalaryDBUtil {

    public static List<Salary> getAllSalaries() {
        List<Salary> salaries = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM salary";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

         // For fetching salary records
            while (rs.next()) {
                int salaryId = rs.getInt("salaryId");
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                double baseSalary = rs.getDouble("baseSalary"); // New column
                double deductions = rs.getDouble("deductions");
                double allowances = rs.getDouble("allowances");
                double salaryAmount = rs.getDouble("salaryAmount");
                String dateIssued = rs.getString("dateIssued");
                salaries.add(new Salary(salaryId, userId, userName, baseSalary, deductions, allowances, salaryAmount, dateIssued));

            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return salaries;
    }

    public static void addSalary(Salary salary) throws Exception {
        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO salary (userId, userName, baseSalary, deductions, allowances, salaryAmount, dateIssued) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, salary.getUserId());
        stmt.setString(2, salary.getUserName());
        stmt.setDouble(3, salary.getBaseSalary()); // Include base salary
        stmt.setDouble(4, salary.getDeductions());
        stmt.setDouble(5, salary.getAllowances());
        stmt.setDouble(6, salary.getSalaryAmount());
        stmt.setString(7, salary.getDateIssued());
        stmt.executeUpdate();

        stmt.close();
        conn.close();
    }


    public static Salary getSalaryById(int salaryId) {
        Salary salary = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM salary WHERE salaryId = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, salaryId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                double baseSalary = rs.getDouble("baseSalary"); // Include base salary
                double deductions = rs.getDouble("deductions");
                double allowances = rs.getDouble("allowances");
                double salaryAmount = rs.getDouble("salaryAmount");
                String dateIssued = rs.getString("dateIssued");

                salary = new Salary(salaryId, userId, userName, baseSalary, deductions, allowances, salaryAmount, dateIssued);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return salary;
    }


    public static void updateSalary(Salary salary) throws Exception {
        Connection conn = DBConnection.getConnection();
        String sql = "UPDATE salary SET userId = ?, userName = ?, baseSalary = ?, deductions = ?, allowances = ?, salaryAmount = ?, dateIssued = ? WHERE salaryId = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, salary.getUserId());
        stmt.setString(2, salary.getUserName());
        stmt.setDouble(3, salary.getBaseSalary()); // Include base salary
        stmt.setDouble(4, salary.getDeductions());
        stmt.setDouble(5, salary.getAllowances());
        stmt.setDouble(6, salary.getSalaryAmount());
        stmt.setString(7, salary.getDateIssued());
        stmt.setInt(8, salary.getSalaryId());
        stmt.executeUpdate();

        stmt.close();
        conn.close();
    }


    public static void deleteSalary(int salaryId) throws Exception {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM salary WHERE salaryId = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, salaryId);
        stmt.executeUpdate();

        stmt.close();
        conn.close();
    }
}

