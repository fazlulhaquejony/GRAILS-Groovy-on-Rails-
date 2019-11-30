package com.fhjony.ocbt

class Contact {
    Integer id
    String name
    String image
    Member member

    Date dateCreated
    Date lastUpdated

    Set<ContactDetails> contactDetails
    Set<ContactGroup> contactGroup

    static  hasMany = [contactDetails: ContactDetails, cotactGroup: ContactGroup]

    static constraints = {
        image(nullable: true, blank: true)
    }

    static mapping = {
        version(false)
        contactDetails(cascade: 'all-delete-orphan')
    }
}
