

class User {
    String NID
    String email
    String mobile
    static constraints = {
        NID()
        email()
        mobile()
    }
}
