

class Txn {

    String txnId
    Integer txnType = 1
    Boolean notifyUser=false
    User signer
    Date dateCreated=new Date()
    Date lastUpdated
    static hasMany = [docs: Document]

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
