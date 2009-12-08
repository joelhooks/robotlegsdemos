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

package com.adobe.cairngorm.control
{   
   import flash.utils.Dictionary;
   import com.adobe.cairngorm.commands.Command;
   
   /**
    * A base class for an application specific front controller,
    * that is able to dispatch control following particular user gestures to appropriate
    * command classes.
    *
    * <p>
    * The Front Controller is the centralised request handling class in a
    * Cairngorm application.  Throughout the application architecture are
    * scattered a number of CairngormEventDispatcher.getInstance().dispatchEvent( event )
    * method calls, that signal to the listening controller that a user gesture
    * has occured.
    * </p>
    *
    * <p>
    * The role of the Front Controller is to first register all the different
    * events that it is capable of handling against worker classes, called
    * Command classes.  On hearing an application event, the Front Controller
    * will look up its table of registered events, find the appropriate
    * command for handling of the event, before dispatching control to the
    * Command by calling its execute() method.
    * </p>
    *
    * <p>
    * The Front Controller is a base-class that  listen for events 
    * dispatched by CairngormEventDispatcher.  In a 
    * Cairngorm application, the developer should create a class that
    * extends the FrontController, and in the constructor of their
    * application specific controller, they should make numerous calls to
    * addCommand() to register all the expected events with application
    * specific Command classes.
    * </p>
    *
    * <p>
    * Consider a LoginController, that is the main controller for a Login
    * application that has 2 user gestures - Login and Logout.  The application
    * will have 2 buttons, "Login" and "Logout" and in the click handler for
    * each button, one of the following methods is executed:
    * </p>
    *
    * <pre>
    * public function doLogin() : void
    * {
    *    var event : LoginEvent = new LoginEvent( username.text, password.text );
    *    CairngormEventDispatcher.getInstance.dispatchEvent( event );
    * }
    *
    * public function doLogout() : void
    * {
    *    var event : LogoutEvent = new LogoutEvent();
    *    CairngormEventDispatcher.getInstance.dispatchEvent( event );
    * }
    * </pre>
    * 
    * <p>
    * We would create LoginController as follows:
    * </p>
    *
    * <pre>
    * class LoginController extends com.adobe.cairngorm.control.FrontController
    * {
    *    public function LoginController()
    *    {
    *       initialiseCommands();
    *    }
    *
    *    public function initialiseCommands() : void
    *    {
    *       addCommand( EVENT_LOGIN, LoginCommand );
    *       addCommand( EVENT_LOGOUT, LogoutCommand );
    *    }
    *   
    *    private static const EVENT_LOGIN : String = "login";
    *    private static const EVENT_LOGOUT : String = "logout";
    * }
    * </pre>
    *
    * <p>
    * In our concrete implementation of a FrontController, LoginController, we
    * register the 2 events that are expected for broadcast - login and logout -
    * using the addCommand() method of the parent FrontController class, to
    * assign a Command class to each event.
    * </p>
    *
    * <p>
    * Adding a new use-case to a Cairngorm application is as simple as
    * registering the event against a command in the application Front Controller,
    * and then creating the concrete Command class.
    * </p>
    * 
    * <p>
    * The concrete implementation of the FrontController, LoginController,
    * should be created once and once only (as we only want a single controller
    * in our application architecture).  Typically, in our main application, we
    * would declare our FrontController child class as a tag, which should be placed
    * above any tags which have a dependency on the FrontController
    * </p>
    *
    * <pre>
    * &lt;mx:Application  xmlns:control="com.domain.project.control.LoginController"   ... &gt;
    *
    *   &lt;control:LoginController id="controller" /&gt;
    *
    *  ...
    * 
    * </pre>
    *
    * @see com.adobe.cairngorm.commands.Command
    */
   public class FrontController
   {
      private var commands : Dictionary = new Dictionary();

      private function executeCommand( event : CairngormEvent ) : void
      {
         var commandToInitialise : Class = getCommand( event.type );
         var commandToExecute : Command = new commandToInitialise();

         commandToExecute.execute( event );
      }

     /**
      * Registers a Command class with the Front Controller, against an event name
      * and listens for events with that name.
      *
      * <p>When an event is broadcast that matches commandName,
      * the Command class referred to by commandRef receives control of the
      * application, by having its execute() method invoked.</p>
      *
      * @param commandName The name of the event that will be broadcast by the
      * when a particular user gesture occurs, eg "login"
      *
      * @param commandRef A Command Class reference upon which execute()
      * can be called when the Front Controller hears an event broadcast with
      * commandName. Typically, this argument is passed as "LoginCommand" 
      * or similar.
      */     
      public function addCommand( commandName : String, commandRef : Class ) : void
      {
         if( commands[ commandName ] != null )
            throw new Error( "Command already registered for " + commandName );
         
         commands[ commandName ] = commandRef;
         CairngormEventDispatcher.getInstance().addEventListener( commandName, executeCommand );
      }
      
      /**
       * Returns the command class registered with the command name. 
       */
      private function getCommand( commandName : String ) : Class
      {
         var command : Class = commands[ commandName ];
         if ( command == null )
            throw new Error( "Command not found for " + commandName );
            
         return command;
      }      
   }   
}
