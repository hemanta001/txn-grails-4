

import grails.gorm.transactions.Transactional

@Transactional
class TxnService {

    def serviceMethod() {

    }
    def list(Map params) {
      return Txn.list(params);
    }
    def count() {
        return Txn.count()
    }
    def get(Long id) {
        return Txn.get(id)
    }
    def save(Txn txn) {
        return txn.save(flush:true)
    }
    def delete(Long id) {
        def txn=Txn.get(id)
        return txn.delete(flush:true)
    }
}
