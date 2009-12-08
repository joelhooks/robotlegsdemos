/*

Copyright (c) 2006. Adobe Systems Incorporated.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
  * Neither the name of Adobe Systems Incorporated nor the names of its
    contributors may be used to endorse or promote products derived from this
    software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

@ignore
*/

package com.adobe.cairngorm.business 
{    
   import mx.rpc.AbstractService;
   import mx.rpc.http.HTTPService;
   import mx.rpc.AbstractInvoker;
   import mx.core.UIComponent;
   
   /**
    * The ServiceLocator class is a psuedo-singleton class, used by the application
    * developer to define and retrieve the services used by the application.
    *
    * <p>
    * The singleton implementation of the ServiceLocator ensures that one
    * and only one class can be responsible for locating services. However,
    * because the ServiceLocator instance is defined in MXML, which requires 
    * a no-args public constructor, the singleton implementation is non-standard,
    * including a public constructor and error handling if the constructor
    * is called more than once.</p>
    *
    * <p>
    * In your application, you should subclass ServiceLocator and define
    * your services, using code similar to the following:
    * </p>
    *
    * <pre>
    * &lt;cairngorm:ServiceLocator xmlns:mx="http://www.adobe.com/2006/mxml"
    *                           xmlns:cairngorm="com.adobe.cairngorm.business.*" &gt;
    *
    *   &lt;mx:RemoteObject id="customerDelegate" source="com.adobe.cairngorm.samples.login.LoginDelegate"
    *                    result="event.token.resultHandler( event )"
    *                    fault="event.token.faultHandler( event )"&gt;
    *   &lt;/mx:RemoteObject&gt;
    *
    * &lt;/cairngorm:ServiceLocator&gt;
    * </pre>
    * 
    * <p>Assuming the above is in a file called <code>Services.mxml</code> in a <code>demo</code>
    * namespace, you can then instantiate your services locator in your Flex application, as follows:
    * <pre>
    *    &lt;demo:Services id="demoServices" /&gt;
    * </pre>
    * </p>
    * <p>Services can later be located, usually in a business delegate class,
    * as shown here:
    * <pre>
    *   this.service = ServiceLocator.getInstance().getService( "customerDelegate" );
    * </pre>
    * </p>
    *
    * <p>
    * In this way, Cairngorm removes any knowledge of the nesting of your application
    * containers, or any reference to mx.core.Application (in Flex), from your data
    * service code.
    * </p>
    */ 
   public class ServiceLocator extends UIComponent
   {
      private static var serviceLocator : ServiceLocator;      
      
      /**
       * Used to fetch the single instance of ServiceLocator class.
       *
       * <p>ServiceLocator is a singleton, and getInstance() is the
       * factory method for the singleton.  If an ServiceLocator has not been
       * created yet, the first call to getInstance() will create it.  Subsequent
       * calls to getInstance() will return the initial instance that was created.</p>
       */
      public static function getInstance() : ServiceLocator
      {
         if ( serviceLocator == null )
            serviceLocator = new ServiceLocator();
   
         return serviceLocator;
      }
      
      /**
       * Public no-args constructor, to allow creation from MXML.
       *
       * <p>ServiceLocator is a singleton, but we want to allow creation from
       * MXML, so we allow creation of the single instance here. If an attempt is made
       * to construct more than one instance, an Error is thrown.</p>
       */
      public function ServiceLocator()
      {
         if ( ServiceLocator.serviceLocator != null )
            throw new Error( "Only one ServiceLocator instance should be instantiated" );
   
         ServiceLocator.serviceLocator = this;
      }
         
      /**
       * Returns the service defined for the id, to allow services to be looked up
       * using the ServiceLocator by a canonical name.
       *
       * <p>If no service exists for the service name, an Error will be thrown.</p>
       * @param The id of the service to be returned. This is the id defined in the
       * concrete service locator implementation.
       */
      public function getService( serviceId : String ) : AbstractService
      {
         if ( this[ serviceId ] == undefined ) 
            throw new Error( "No service found for service name " + serviceId );
         
         return this[ serviceId ];
      }      

      
      /**
       * Helper function to return the http service defined for the id, to allow services to be looked up
       * using the ServiceLocator by a canonical name. Uses <code>getInvokerService</code>.
       *
       * <p>description If no service exists for the service name, an Error will be thrown.</p>
       * @param The id of the service to be returned. This is the id defined in the
       * concrete service locator implementation.
       */
      public function getHTTPService( serviceId : String ) : HTTPService
      {
         return HTTPService( getInvokerService( serviceId ) );
      }
      
      /**
       * Returns an AbstractInvoker defined for the id, to allow services to be looked up
       * using the ServiceLocator by a canonical name.
       *
       * <p>description If no service exists for the service name, an Error will be thrown.</p>
       * @param The id of the service to be returned. This is the id defined in the
       * concrete service locator implementation.
       */
      public function getInvokerService( serviceId : String ) : AbstractInvoker
      {
         if ( this[ serviceId ] == undefined ) 
            throw new Error( "No invoker service found for HTTP service name " + serviceId );
         
         return this[ serviceId ];
      }      
   }   
}