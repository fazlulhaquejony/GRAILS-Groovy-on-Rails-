package com.fhjony.ocbt

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class MemberInterceptorSpec extends Specification implements InterceptorUnitTest<MemberInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test member interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"member")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
