

class FileTxn {

    Date dateCreated
    Date lastUpdated
    String originalFilename
    String extension
    String contentType
    String name
    String size

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
    }
    def beforeInsert() {
        dateCreated = new Date()
    }

    def beforeUpdate() {
        lastUpdated = new Date()
    }
}
