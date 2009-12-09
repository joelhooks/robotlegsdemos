package  com.adobe.cafetownsend.vo {
	
	[Bindable]
	public class User {

		public var username : String;
		public var password : String;

		public function User( username : String, password : String ) {
			this.username = username;
			this.password = password;
			}
		}
	}