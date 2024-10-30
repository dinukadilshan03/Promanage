package leave.model;

public class Leave {
	private int id;
	private String employeeId;
	private String leaveType;
	private String fromDate;
	private String toDate;
	private String reason;
	private String status;

	public int getId() {
		return id;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public String getFromDate() {
		return fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public String getReason() {
		return reason;
	}

	public String getStatus() {
		return status;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Getters and Setters for each field

}
