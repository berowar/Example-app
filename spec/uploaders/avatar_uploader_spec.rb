describe AvatarUploader do
  include CarrierWave::Test::Matchers

  before do
    AvatarUploader.enable_processing = true
    @uploader = AvatarUploader.new(User.new, :avatar)
    @uploader.store!(File.open("#{Rails.root}/spec/fixtures/test.jpg"))
  end

  after do
    AvatarUploader.enable_processing = false
  end

  it "should scale down a landscape image to be exactly 100 by 100 pixels" do
    @uploader.should have_dimensions(100, 100)
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 50 by 50 pixels" do
      @uploader.thumb.should have_dimensions(50, 50)
    end
  end
end