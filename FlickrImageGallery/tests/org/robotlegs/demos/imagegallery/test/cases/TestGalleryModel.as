package org.robotlegs.demos.imagegallery.test.cases
{
	import org.flexunit.Assert;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.demos.imagegallery.models.vo.Gallery;
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;

	public class TestGalleryModel
	{
		private var galleryModel:GalleryModel;
		
		[Before]
		public function setUp():void
		{
			this.galleryModel = new GalleryModel()
		}
		
		[After]
		public function tearDown():void
		{
			this.galleryModel = null;
		}
		
		[Test]
		public function testSetGallery():void
		{
			var gallery:Gallery = new Gallery();
			this.galleryModel.gallery = gallery;
			Assert.assertEquals("galleryModel should have a gallery", 
				this.galleryModel.gallery != null, true );
		}
		
		[Test]
		public function testSetSelectedImage():void
		{
			var image1:GalleryImage = new GalleryImage()
			var image2:GalleryImage = new GalleryImage()
			var gallery:Gallery = new Gallery()
			this.galleryModel.gallery = gallery;
			gallery.photos.addItem(image1);
			gallery.photos.addItem(image2);
			image1.selected = false;
			image2.selected = true;
			this.galleryModel.setSelectedImage(image1);
			Assert.assertEquals("Image1 should be selected", image1.selected, true);
			Assert.assertEquals("Image 2 should NOT be selected", image2.selected, false);
		}
	}
}