#
#  Copyright (C) 2001, 2002 MIT
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

ad_page_contract {
    The display logic for the ETP admin portlet
    
    @author Stefan Wurdack (dotlrn@email.wuon.de)

} -properties {
    
}

# Configuration
array set config $cf	

# Should be a list already! 
set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error [_ edit-this-page-portlet.one_admin_edit-this-page]
}        

set package_id [lindex $list_of_package_ids 0]
set etp_existence [db_exec_plsql folder_existence ""]
set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]
if {${etp_existence} == 0} {
    set etp_link_attribute etp-install-portlet
    set url_fs 0
}
if {${etp_existence} > 0} {
    set etp_link_attribute etp
    set url_fs "$url/file-storage/"
}
set url "$url$etp_link_attribute"
ad_return_template
