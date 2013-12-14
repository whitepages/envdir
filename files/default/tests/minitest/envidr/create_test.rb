require File.expand_path('../support/helpers', __FILE__)

describe 'envdir::create' do

  include Helpers::Envdir

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'creates a directory' do
    directory("/etc/test.d/env").must_exist.with(:owner, "root").with(:group, "root").with(:mode, 0555)
  end

  [
    ["/etc/test.d/env/HOME", "/home/ubuntu"],
    ["/etc/test.d/env/PATH", "/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"]
  ].each do |data|
    it "creates file #{data[0]}" do
      file, content = data
      file(file).must_exist.with(:owner, "root").with(:mode, "0444")
      file(file).must_match content
    end
  end

end
