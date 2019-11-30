package com.fhjony.ocbt

class User {
    Integer id
    String firstName
    String lastName
    String email
    String password
    String userType =GlobalConfig.USER_TYPE.REGULAR_user
    String identityHash
    Date identityHashLastUpdate
    Boolean isActive =true

    Date dateCreated
    Date lastUpdated

    static constraints = {
        email(email: true, nullable: false, unique: true, blank: false)
        password(blank: false)
        firstName(nullable: false)
        lastName(nullable: true)
        identityHash(nullable: true)
        identityHashLastUpdate(nullable: true)
    }

    def beforeInsert()
    {
        this.password = this.password.encodeAsMD5()
    }

    def beforeUpdate()
    {
        this.password = this.password.encodeAsMD5()
    }
}
