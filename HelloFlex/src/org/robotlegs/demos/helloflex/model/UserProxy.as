/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package org.robotlegs.demos.helloflex.model
{
	import org.robotlegs.mvcs.Actor;
	
	public class UserProxy extends Actor
	{
		private var username:String;
		private var loggedIn:Boolean;
		
		public function UserProxy()
		{
		}
		
		public function setUsername(username:String):void
		{
			this.username = username;
			dispatch(new UserProxyEvent(UserProxyEvent.USERNAME_CHANGED));
		}
		
		public function set userLoggedIn(value:Boolean):void
		{
			loggedIn = value;
			if (loggedIn)
			{
				dispatch(new UserProxyEvent(UserProxyEvent.USER_LOGGED_IN));
			}
			else
			{
				dispatch(new UserProxyEvent(UserProxyEvent.USER_LOGGED_OUT));
			}
		}
		
		public function get userLoggedIn():Boolean
		{
			return loggedIn;
		}
	
	}
}