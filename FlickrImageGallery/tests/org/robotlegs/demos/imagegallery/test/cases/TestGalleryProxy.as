package org.robotlegs.demos.imagegallery.test.cases
{
	import org.flexunit.Assert;
	import org.robotlegs.demos.imagegallery.models.proxies.GalleryProxy;
	import org.robotlegs.demos.imagegallery.models.vo.Gallery;
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;

	public class TestGalleryProxy
	{
		private var galleryProxy:GalleryProxy;
		
		[Before]
		public function setUp():void
		{
			this.galleryProxy = new GalleryProxy()
		}
		
		[After]
		public function tearDown():void
		{
			this.galleryProxy = null;
		}
		
		[Test]
		public function testSetGallery():void
		{
			var gallery:Gallery = new Gallery();
			this.galleryProxy.gallery = gallery;
			Assert.assertEquals("GalleryProxy should have a gallery", this.galleryProxy.gallery != null, true );
		}
		
		[Test]
		public function testSetSelectedImage():void
		{
			var image1:GalleryImage = new GalleryImage()
			var image2:GalleryImage = new GalleryImage()
			var gallery:Gallery = new Gallery()
			this.galleryProxy.gallery = gallery;
			gallery.photos.addItem(image1);
			gallery.photos.addItem(image2);
			image1.selected = false;
			image2.selected = true;
			this.galleryProxy.setSelectedImage(image1);
			Assert.assertEquals("Image1 should be selected", image1.selected, true);
			Assert.assertEquals("Image 2 should NOT be selected", image2.selected, false);
		}
	}
}