package empDetails.model;

public class Employee {
	private int id;
	private String name;
	private String email;
	private String type; // New field
	private String department; // New field
	private String phoneNumber; // New field
	private String address; // New field

	// Constructor with all fields
	public Employee(int id, String name, String email, String type, String department, String phoneNumber,
			String address) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.type = type;
		this.department = department;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	// Constructor without id (for new employees)
	public Employee(String name, String email, String type, String department, String phoneNumber, String address) {
		this.name = name;
		this.email = email;
		this.type = type;
		this.department = department;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
