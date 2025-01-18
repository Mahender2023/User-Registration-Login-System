package pack;

public class User {
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String dateOfBirth;
    private String pincode;
    private String address;

    // Constructor
    public User(String firstName, String lastName, String email, String phone, String dateOfBirth, String pincode, String address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.dateOfBirth = dateOfBirth;
        this.pincode = pincode;
        this.address = address;
    }

    // Getters
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getDateOfBirth() { return dateOfBirth; }
    public String getPincode() { return pincode; }
    public String getAddress() { return address; }
}
