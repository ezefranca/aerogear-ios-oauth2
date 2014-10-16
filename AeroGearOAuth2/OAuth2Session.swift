/*
* JBoss, Home of Professional Open Source.
* Copyright Red Hat, Inc., and individual contributors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import Foundation

/**
The protocol that an OAuth2 Session modules must adhere to and represent storage of oauth specific metadata. See TrustedPersistantOAuth2Session and UntrustedMemoryOAuth2Session as example implementations
*/
public protocol OAuth2Session {
    
    /**
    * The account id.
    */
    var accountId: String {get}
    
    /**
    * The access token which expires.
    */
    var accessToken: String? {get set}
    
    /**
    * The access token's expiration date.
    */
    var accessTokenExpirationDate: NSDate? {get set}
    
    /**
    * The refresh tokens. This toke does not expire and should be used to renew access token when expired.
    */
    var refreshToken: String? {get set}
    
    /**
    * Check validity of accessToken. return true if still valid, false when expired.
    */
    func tokenIsNotExpired() -> Bool
    
    /**
    * Clears any tokens storage
    */
    func saveAccessToken()
    
    /**
    * Save tokens information. Saving tokens allow you to refresh accesstoken transparently for the user without prompting
    * for grant access.
    
    :param: accessToken the access token
    :param: refreshToken  the refresh token
    :param: expiration the expiration
    */
    func saveAccessToken(accessToken: String?, refreshToken: String?, expiration: String?)
}
