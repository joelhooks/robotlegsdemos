package org.robotlegs.demos.imagegallery.test.suites
{
	import org.robotlegs.demos.imagegallery.test.cases.TestFlickrService;
	import org.robotlegs.demos.imagegallery.test.cases.TestGalleryLabelMediation;
	import org.robotlegs.demos.imagegallery.test.cases.TestGalleryProxy;
	import org.robotlegs.demos.imagegallery.test.cases.TestGalleryViewMediation;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class RobotlegsImageGalleryTestSuite
	{
		public var testFlickrService:TestFlickrService;
		public var testGalleryProxy:TestGalleryProxy;
		public var testGalleryLabel:TestGalleryLabelMediation;
		public var testGalleryViewMediation:TestGalleryViewMediation;
	}
}