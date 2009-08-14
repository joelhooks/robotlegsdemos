package org.robotlegs.demos.whereswindow.test.cases
{
	import mx.utils.UIDUtil;
	
	import org.flexunit.Assert;
	import org.robotlegs.demos.whereswindow.model.OpenWindowsProxy;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;

	public class TestOpenWindowsProxy
	{
		protected var openWindowsProxy:OpenWindowsProxy;
		protected var testWindowUID:String;
		
		[Before]
		public function setUp():void
		{
			this.openWindowsProxy = new OpenWindowsProxy();
			this.testWindowUID = UIDUtil.createUID();
		}
		
		[After]
		public function tearDown():void
		{
			this.openWindowsProxy = null;
			this.testWindowUID = null;
		}
		
		[Test]
		public function testCreateWindow():void
		{
			var window:InfoWindow = openWindowsProxy.createWindow( );
			this.testWindowUID = window.id;
			Assert.assertNotNull( window )
			Assert.assertEquals( window.id, this.testWindowUID );
			Assert.assertTrue( window is InfoWindow );
		}
		
		[Test]
		public function testProxyHasWindowUID():void
		{
			var window:InfoWindow = openWindowsProxy.createWindow( );
			this.testWindowUID = window.id;
			Assert.assertTrue( this.openWindowsProxy.hasWindowUID( this.testWindowUID ) );
		}
		
		[Test]
		public function testGetWindowById():void
		{
			var window:InfoWindow = openWindowsProxy.createWindow( );
			this.testWindowUID = window.id;
			Assert.assertEquals( window, this.openWindowsProxy.getWindowFromUID( this.testWindowUID ) );
		}
		
		[Test]
		public function testGetWindowIdIsSame():void
		{
			var window:InfoWindow = openWindowsProxy.createWindow( );
			this.testWindowUID = window.id;
			Assert.assertEquals( window.id, this.openWindowsProxy.getWindowFromUID( this.testWindowUID ).id );			
		}
		
		[Test]
		public function testRemoveWindowByUID():void
		{
			var window:InfoWindow = openWindowsProxy.createWindow( );
			this.testWindowUID = window.id;
			Assert.assertTrue( this.openWindowsProxy.hasWindowUID( this.testWindowUID ) );
			
			this.openWindowsProxy.removeWindowByUID( this.testWindowUID );
			Assert.assertFalse( this.openWindowsProxy.hasWindowUID( this.testWindowUID ) );
			
		}
		
	}
}