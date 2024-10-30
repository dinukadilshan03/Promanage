package salary.model;

public class Salary {
    private int salaryId;
    private int userId;
    private String userName;
    private double baseSalary; // New attribute
    private double deductions;
    private double allowances;
    private double salaryAmount;
    private String dateIssued;

    // Constructor for adding a new salary
    public Salary(int userId, String userName, double baseSalary, double deductions, double allowances, String dateIssued) {
        this.userId = userId;
        this.userName = userName;
        this.baseSalary = baseSalary;
        this.deductions = deductions;
        this.allowances = allowances;
        this.dateIssued = dateIssued;
        this.salaryAmount = calculateSalaryAmount();
    }

    // Constructor for listing existing salaries
    public Salary(int salaryId, int userId, String userName, double baseSalary, double deductions, double allowances, double salaryAmount, String dateIssued) {
        this.salaryId = salaryId;
        this.userId = userId;
        this.userName = userName;
        this.baseSalary = baseSalary;
        this.deductions = deductions;
        this.allowances = allowances;
        this.salaryAmount = salaryAmount;
        this.dateIssued = dateIssued;
    }

   

    // Update salary calculation
    private double calculateSalaryAmount() {
        return baseSalary + allowances - deductions;
    }

    // Getters and setters for baseSalary
    public double getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(double baseSalary) {
        this.baseSalary = baseSalary;
    }

    // Getters and setters
    public int getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(int salaryId) {
        this.salaryId = salaryId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public double getDeductions() {
        return deductions;
    }

    public void setDeductions(double deductions) {
        this.deductions = deductions;
    }

    public double getAllowances() {
        return allowances;
    }

    public void setAllowances(double allowances) {
        this.allowances = allowances;
    }

    public double getSalaryAmount() {
        return salaryAmount;
    }

    public void setSalaryAmount(double salaryAmount) {
        this.salaryAmount = salaryAmount;
    }

    public String getDateIssued() {
        return dateIssued;
    }

    public void setDateIssued(String dateIssued) {
        this.dateIssued = dateIssued;
    }
}

