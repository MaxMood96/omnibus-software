#
# This file is used to configure the harmony project. It contains
# some minimal configuration examples for working with Omnibus. For a full list
# of configurable options, please see the documentation for +omnibus/config.rb+.
#

# Build internally
# ------------------------------
# By default, Omnibus uses system folders (like +/var+ and +/opt+) to build and
# cache components. If you would to build everything internally, you can
# uncomment the following options. This will prevent the need for root
# permissions in most cases. You will also need to update the harmony
# project configuration to build at +./local/omnibus/build+ instead of
# +/opt/harmony+
#
# Uncomment this line to change the default base directory to "local"
# -------------------------------------------------------------------
# base_dir './local'
#
# Alternatively you can tune the individual values
# ------------------------------------------------
# cache_dir     './local/omnibus/cache'
# git_cache_dir './local/omnibus/cache/git_cache'
# source_dir    './local/omnibus/src'
# build_dir     './local/omnibus/build'
# package_dir   './local/omnibus/pkg'
# package_tmp   './local/omnibus/pkg-tmp'

# Windows architecture defaults - set to x86 unless otherwise specified.
# ------------------------------
env_omnibus_windows_arch = (ENV["OMNIBUS_WINDOWS_ARCH"] || "").downcase
env_omnibus_windows_arch = :x64 unless %w{x86 x64}.include?(env_omnibus_windows_arch)

windows_arch env_omnibus_windows_arch

# Disable git caching
# ------------------------------
use_git_caching false

# Enable S3 asset caching
# ------------------------------
use_s3_caching false

# Customize compiler bits
# ------------------------------
# solaris_compiler 'gcc'

# Do not retry builds
# ------------------------------
build_retries 0

if ENV["SKIP_HEALTH_CHECK"]
  health_check false
end

fips_mode ENV["OMNIBUS_FIPS_MODE"] if ENV["OMNIBUS_FIPS_MODE"]

# Load additional software
# ------------------------------
# software_gems ['omnibus-software', 'my-company-software']
# local_software_dirs ['/path/to/local/software']
