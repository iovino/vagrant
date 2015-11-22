#
# DIVUPS
#
# Copyright (c) 2011-2014, DIVUPS, LLC.
#

package "sqlite"
package "libsqlite3-dev"
package "make"
package "g++"
package "ruby-dev"

gem_package "mailcatcher"

bash "mailcatcher" do
    code "mailcatcher --http-ip 0.0.0.0 --http-port 1080 --smtp-ip 127.0.0.1 --smtp-port 1025"
end