require File.expand_path('../support/helpers', __FILE__)

describe 'envdir::default' do

  include Helpers::Envdir

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'install daemontools' do
    package('daemontools').must_be_installed
  end

end
