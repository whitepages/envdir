require File.expand_path('../support/helpers', __FILE__)

describe 'envdir::replace' do

  include Helpers::Envdir

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'removed PATH' do
    file('/etc/test.d/env/PATH').wont_exist
  end

  [
    ["/etc/test.d/env/HOME", "/root"],
    ["/etc/test.d/env/TEST", "foo"]
  ].each do |data|
    it "creates file #{data[0]}" do
      file, content = data
      file(file).must_exist.with(:owner, "root").with(:mode, "0444")
      file(file).must_match content
    end
  end

end
