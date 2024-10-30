package task.model;

import java.util.Date;

public class Task {
	private int taskId; // Task ID
	private String taskName; // Name of the task
	private String assignedTo; // Username of the person assigned to the task
	private String status = "ongoing"; // Status of the task (e.g., "ongoing", "finished")
	private String description; // Description of the task
	private String priority; // Priority of the task (e.g., "high", "medium", "low")
	private Date deadline; // Deadline for the task

	// Default constructor
	public Task() {
	}

	// Parameterized constructor
	public Task(int taskId, String taskName, String assignedTo, String status, String description, String priority,
			Date deadline) {
		this.taskId = taskId;
		this.taskName = taskName;
		this.assignedTo = assignedTo;
		this.status = status;
		this.description = description;
		this.priority = priority;
		this.deadline = deadline;
	}

	// Getter and setter for taskId
	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	// Getter and setter for taskName
	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	// Getter and setter for assignedTo
	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	// Getter and setter for status
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Getter and setter for description
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// Getter and setter for priority
	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	// Getter and setter for deadline
	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
}
