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

    @author Stefan Wurdack (dotlrn@email.wuon.de)

}

# Das ist die tcl- datei

array set config $cf	
set shaded_p $config(shaded_p)
set list_of_package_ids $config(package_id)
set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]

set etpp_package_id [ad_conn package_id]
db_multirow etpp_node_id select_etpp_node_id {}

if {${etpp_node_id:rowcount} == 1} {

    set etpp_site_node [lindex [array get {etpp_node_id:1} node_id] 1]
    set etpp_site_node_name edit-this-page

    db_multirow etpp_object_id select_etpp_object_id {}
    set etpp_object [lindex [array get {etpp_object_id:1} object_id] 1]

    db_multirow etpp_folder_id select_etpp_folder_id {}
    set etpp_folder_id [lindex [array get {etpp_folder_id:1} folder_id] 1]
#    set etpp_folder_id [db_exec_plsql select { select etp__get_folder_id(:etpp_object)}]

    set etpp_list ""

    db_foreach select_etpp_revisions {} {
	lappend etpp_list [list "edit-this-page/$url" $name $sort_order $etpp_help_var]
    } if_no_rows {
    }

    db_foreach select_etpp_extlinks {} {
        lappend etpp_list [list $url $name $sort_order $etpp_help_var]
    } if_no_rows {
    }

    db_foreach select_etpp_subfolders {} {
        lappend etpp_list [list "edit-this-page/$url" $name $sort_order $etpp_help_var]
    } if_no_rows {
    }

    # sort all data
    set etpp_list [lsort -index 2 $etpp_list]

    # create multirow
    multirow create etpp_result url name
    foreach elm $etpp_list {
	multirow append etpp_result \
	    [lindex $elm 0] \
	    [lindex $elm 1]
    }
}

ad_return_template