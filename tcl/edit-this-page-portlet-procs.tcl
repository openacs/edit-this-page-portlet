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

ad_library {

    Procedures to support the edit-thois-page portlet

    @author Stefan Wurdack (dotlrn@email.wuon.de)

}

namespace eval edit-this-page_portlet {

    ad_proc -private get_my_name {
    } {
        return "edit-this-page_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "edit-this-page-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#edit-this-page-portlet.pretty_name#"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
        {-param_action:required}
    } {
        Adds a edit-this-page PE to the given portal or appends the given
        edit-this-page_package_id to the params of the edit-this-page pe already there

        @param portal_id The page to add self to
        @param edit-this-page_package_id the id of the edit-this-page package for this community

        @return element_id The new element's id
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id \
            -pretty_name [get_pretty_name] \
            -force_region [parameter::get_from_package_key \
                               -package_key [my_package_key] \
                               -parameter "edit-this-page_portlet_force_region"] \
            -param_action $param_action
        ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Removes a edit-this-page PE from the given page or just the passed
        in edit-this-page_package_id parameter from the portlet
        (that has other edit-this-page_package_ids)

        @param portal_id The page to remove self from
        @param package_id
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
    }

    ad_proc -public show {
        cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "edit-this-page-portlet"
    }

}
