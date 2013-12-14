require File.expand_path('../support/helpers', __FILE__)

describe 'envdir::delete' do

  include Helpers::Envdir

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'deletes the directory' do
    directory("/etc/test.d/env").wont_exist
  end

end
