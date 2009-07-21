package org.robotlegs.demos.imagegallery.test.suites
{
	import org.robotlegs.demos.imagegallery.test.cases.TestFlickrService;
	import org.robotlegs.demos.imagegallery.test.cases.TestGalleryProxy;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class RobotlegsImageGalleryTestSuite
	{
		public var testFlickrService:TestFlickrService;
		public var testGalleryProxy:TestGalleryProxy;
	}
}