require File.expand_path('../spec_helper', __FILE__)

class MockExternalSource
  def initialize
  end

  def fetch
  end
end

module Pod
  describe DeployDownloader do

    before do
      @podfile = Podfile.new
      Config.instance.stubs(:podfile).returns(@podfile)

      @dependency = Dependency.new("Pod", { :podspec => ""})
      @downloader = DeployDownloader.new(@dependency)

      @source = MockExternalSource.new
      ExternalSources.stubs(:from_dependency).returns(@source)
    end

    it "should download source from main repo" do
      @source.expects(:fetch)
      @downloader.download(Config.instance)
    end

    it "should download source from external repo" do
    end
  end
end
